# Imersão DevOps - Alura Google Cloud

Este projeto é uma API desenvolvida com FastAPI para gerenciar alunos, cursos e matrículas em uma instituição de ensino.

## Pré-requisitos

- [Python 3.10 ou superior instalado](https://www.python.org/downloads/)
- [Git](https://git-scm.com/downloads)
- [Docker](https://www.docker.com/get-started/)

## Passos para subir o projeto

1. **Faça o download do repositório:**
   [Clique aqui para realizar o download](https://github.com/guilhermeonrails/imersao-devops/archive/refs/heads/main.zip)

2. **Crie um ambiente virtual:**
   ```sh
   python3 -m venv ./venv
   ```

3. **Ative o ambiente virtual:**
   - No Linux/Mac:
     ```sh
     source venv/bin/activate
     ```
   - No Windows, abra um terminal no modo administrador e execute o comando:
   ```sh
   Set-ExecutionPolicy RemoteSigned
   ```

     ```sh
     venv\Scripts\activate
     ```

4. **Instale as dependências:**
   ```sh
   pip install -r requirements.txt
   ```

5. **Execute a aplicação:**
   ```sh
   uvicorn app:app --reload
   ```

6. **Acesse a documentação interativa:**

   Abra o navegador e acesse:  
   [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)

   Aqui você pode testar todos os endpoints da API de forma interativa.

---

## Estrutura do Projeto

- `app.py`: Arquivo principal da aplicação FastAPI.
- `models.py`: Modelos do banco de dados (SQLAlchemy).
- `schemas.py`: Schemas de validação (Pydantic).
- `database.py`: Configuração do banco de dados SQLite.
- `routers/`: Diretório com os arquivos de rotas (alunos, cursos, matrículas).
- `requirements.txt`: Lista de dependências do projeto.

---

- O banco de dados SQLite será criado automaticamente como `escola.db` na primeira execução.
- Para reiniciar o banco, basta apagar o arquivo `escola.db` (isso apagará todos os dados).

---
## Documentação do Primeiro Dia da Imersão DevOps
### 1. Criação do Ambiente usando Docker - Dockerfile
- **Dockerfile:**
- Cria uma imagem Docker com o Python 3.10 e instala as dependências do projeto.
- Executa o projeto FastAPI.
- A imagem Docker é criada com o nome `alura-fastapi`.
- O projeto é executado com o comando `uvicorn app:app --reload`.
- A porta 8000 é exposta para acesso externo.

docker build -t app-alura-aula-01 .

Alalisando Imagem Criada:
docker image ls
Rodando a Imagem:
docker container run -d -p 8000:8000 app-alura-aula-01

## Na Segunda Aula da Imersão DevOps:
### 2. Criação do Ambiente usando Docker Compose - docker-compose.yml
- **docker-compose.yml:**
- Define um serviço chamado `app` que usa a imagem `app-alura-aula-01`.
- Executa o projeto FastAPI
- A porta 8000 é exposta para acesso externo.
- O projeto é executado com o comando `uvicorn app:app --reload`.
- O serviço `app` depende do serviço `db` para acessar o banco de dados SQLite.

docker-compose up -d

# Criamos um workflow para criar a imagem do projeto sando GuitHub Actions:
Usando a Action do Docker Hub: Docker Image
- Criamos um arquivo chamado .github/workflows/docker-image.yml
- Esse arquivo contém as instruções para criar a imagem Docker do projeto.
- O arquivo é executado automaticamente pelo GitHub Actions quando o código é enviado para o repositório.
- A imagem Docker é criada com o nome `alura-fastapi`.
- A imagem é enviada para o Docker Hub.
  
## Na Terceira Aula da Imersão DevOps
### Instalação do Google Cloud SDK
- Baixe o instalador do Google Cloud SDK:
 https://cloud.google.com/sdk/docs/install#deb

 - Instale o Google Cloud SDK:
'''sh
 sudo apt-get update && sudo apt-get install google-cloud-cli
 gcloud init
'''
- Acesse a Console do Google Cloud Platform:
  https://console.cloud.google.com/

'''sh
gcloud projects list
PROJECT_ID                 NAME                       PROJECT_NUMBER
imersaodevops-alura-52942  ImersaoDevOps-Alura-52942  878575708569
isometric-goods-2q6tl                                 497042443699
lab-gke-25072023           Lab-gke-25072023           537613211020
my-project-23072024        My Project 23072024        836941744682
uplifted-smile-388422      My First Project           348376834025

gcloud config set project imersaodevops-alura-52942
'''

## Build da Aplicação no Google Cloud Build

Building using Dockerfile and deploying container to Cloud Run service [app] in project [imersaodevops-alura-52942] region [southamerica-east1]
✓ Building and deploying new service... Done.                                                                                          
  ✓ Creating Container Repository...                                                                                                   
  ✓ Uploading sources...                                                                                                               
  ✓ Building Container... Logs are available at [https://console.cloud.google.com/cloud-build/builds;region=southamerica-east1/62cc4d4f
  -19d5-4ebf-abc9-23350b039a82?project=878575708569].                                                                                  
  ✓ Creating Revision...                                                                                                               
  ✓ Routing traffic...                                                                                                                 
  ✓ Setting IAM Policy...                                                                                                              
Done.                                                                                                                                  
Service [app] revision [app-00001-bzz] has been deployed and is serving 100 percent of traffic.

Service URL: https://app-878575708569.southamerica-east1.run.app/docs