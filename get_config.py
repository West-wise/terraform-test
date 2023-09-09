import json
import os

# config.json 파일의 경로
config_file_path = os.path.join(os.path.dirname(__file__), 'config.json')

# config.json 파일을 읽어서 토큰 값을 추출
with open(config_file_path) as config_file:
    config = json.load(config_file)
    github_token = config.get('github_token')
    aws_access_key = config.get('aws_access_key')
    aws_secret_key = config.get('aws_secret_key')

# 토큰 값을 JSON 형식으로 출력
output = {
    "github_token": github_token,
    "aws_access_key": aws_access_key,
    "aws_secret_key": aws_secret_key
}
print(json.dumps(output))
