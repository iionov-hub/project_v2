import requests, re, time, json, datetime, sys

from time import gmtime, strftime


class Mluvii():
    def __init__(self):
        self.mluvii_token_url = 'https://app.mluvii.com/login/connect/token'

        self._session = requests.Session()

        self.client_id = None
        self.client_secret = None

        self.header = None

        self.token_header = None
        self.token_body = None

        self.access_token = None
        self.expires_in = None
        self.token_type = None

        self.wget_header = None

    def setup_token_params(self):
        self.token_header = {
            'Content-Type': 'application/x-www-form-urlencoded'
        }
        self.token_body = {
            'response_type': 'token',
            'grant_type': 'client_credentials',
            'client_id': self.client_id,
            'client_secret': self.client_secret
        }

    def setup_wget_params(self):
        self.wget_header = {
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + self.access_token
        }

    def setup_auth_params(self, client_id, client_secret):
        self.client_id = client_id
        self.client_secret = client_secret

    def auth(self):
        response = requests.post(self.mluvii_token_url, data=self.token_body)

        if response.status_code == 200:
            json_data = json.loads(response.text)
            self.access_token = json_data['access_token']
            self.expires_in = json_data['expires_in']
            self.token_type = json_data['token_type']

        return response

    def wget(self, url):
        result = self._session.get(url, headers=self.wget_header)
        return result

    def my_ip(self):
        result = self.wget('http://icanhazip.com/', headers=self.header)
        return result.text.split('\n')[0]


def get_query(min_date, max_date, limit=1):
    ''' Принимает два массива - min_date и max_date
        Формат: ['гггг-мм-дд', 'ч', 'м']
        limit - целое число ∈ [1, ∞)'''

    if len(min_date) == 0: min_date = ['2000-00-00']
    if len(max_date) == 0: max_date = [strftime("%Y-%m-%d", gmtime())]

    query = 'https://app.mluvii.com/api/v1/Sessions?Created.Min={0}&Created.Max={1}&limit={2}'

    def get_str_time(date, h, m, s):
        norm = lambda t: '0' * (2 - len(t)) + t
        border = ''

        if len(date) == 1:
            border += date[0] + 'T{}:{}:{}'.format(h, m, s)
        if len(date) == 2:
            border += date[0] + 'T{}:{}:{}'.format(norm(date[1]), m, s)
        if len(date) == 3:
            border += date[0] + 'T{}:{}:{}'.format(norm(date[1]), norm(date[2]), s)

        return border

    min_date = get_str_time(min_date, '00', '00', '00')
    max_date = get_str_time(max_date, '23', '59', '59')

    query = query.format(min_date, max_date, limit)

    return query


client_id = 'e98b7a092d4524f08e4a240f28ef11d6'
client_secret = '68dfaedbff780fe970638285918135ad'

mluvii = Mluvii()
mluvii.setup_auth_params(client_id, client_secret)
mluvii.setup_token_params()
response = mluvii.auth()

if response.status_code == 200:
    print('[{}]: Аутентификация успешна!'.format(response.reason))
else:
    print("Что-то пошло не так...", response.status_code, response.reason)

mluvii.setup_wget_params()

query = get_query(['2020-06-10', '08', '00'], ['2020-06-10', '08', '59'], limit=10000)

data = mluvii.wget(query)

if data.status_code == 200:
    print('[{}]: Данные успешно извлечены!'.format(data.reason))

else:
    print("\nЧто-то пошло не так...\n[{}]: {}".format(data.status_code, data.reason))

json_data = json.loads(data.text)
print("Всего строк за указанный период: {}".format(len(json_data)))
total = len(json_data)

for i, data in enumerate(json_data[:total]):
    if len(data['activities'])>0:
        ##print("{}) {}".format(i, data['activities'][0]['text']))
        print(data['activities'][0]['text'])
        print(data['activities'])
        print(data['id'])
        print(data['companyId'])
        print(data['source'])
        ##print(data['firstName'])
        ##print(data['operators'][0]['firstName'])
        ##print(data['operators']['firstName'])
