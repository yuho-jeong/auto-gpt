# AutoGPT: An Autonomous GPT-4 Experiment

I removed the original README.md and added my own README.md for the simplicity.

## Installation

Please see the [documentation][docs] for full setup instructions and configuration options.

1. Check out the [wiki](https://github.com/Significant-Gravitas/Auto-GPT/wiki)
2. Get an OpenAI [API Key](https://platform.openai.com/account/api-keys)
3. Download this repository or [latest release](https://github.com/Significant-Gravitas/Auto-GPT/releases/latest) or [modified version of UpstageAI](https://github.com/ChatGPTUp/Auto-GPT)
4. Follow the [installation instructions](https://docs.agpt.co/setup/)
5. Configure any additional features you want, or install some [plugins](https://docs.agpt.co/plugins/)

### Setup

You have to set initial parameters in `.env` file.

```shell
OPENAI_API_KEY=${YOUR_OPENAI_API_KEY}
SLACK_SIGNING_SECRET=${YOUR_SLACK_SIGNING_SECRET}
SLACK_BOT_TOKEN=${YOUR_SLACK_BOT_TOKEN}
```

## Run in Terminal

Please use python 3.10 or higher.

```shell
./run.sh --help   # lists all the possible command line arguments
./run.sh 
```

## Run FastAPI Server

If you use host port 8000 and container port 30207, you can use the following command.

```shell
docker build -t auto-gpt .
docker run -it -p 8000:30207 --env-file=.env -v $PWD:/app --rm auto-gpt
```

I used DigitalOcean to deploy FastAPI server.

1. Login to https://cloud.digitalocean.com
2. Create a droplet. I used Ubuntu 22.04 - Basic/Premium Intel/14$ option.

## Slack Integration

TBU

- https://jaeyung1001.tistory.com/entry/Slack-ChatGPT-Slack-챗봇-만들기-1편
- https://jaeyung1001.tistory.com/entry/Slack-ChatGPT-Slack-챗봇-만들기-2편
- https://jaeyung1001.tistory.com/entry/Slack-ChatGPT-Slack-챗봇-만들기-3편
