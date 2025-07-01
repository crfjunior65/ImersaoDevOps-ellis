# Use uma imagem base oficial do Python.
# A imagem 'slim' é uma boa escolha por ser leve e ter boa compatibilidade com pacotes Python.
# O readme menciona Python 3.10 ou superior, então vamos usar uma versão estável.
FROM python:3.10-slim

# Define o diretório de trabalho no contêiner para /app
WORKDIR /app

# Copia o arquivo de dependências primeiro para aproveitar o cache de camadas do Docker.
# A instalação das dependências só será executada novamente se o requirements.txt for alterado.
COPY requirements.txt .

# Instala as dependências do projeto.
# Usar --no-cache-dir reduz o tamanho final da imagem.
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho.
COPY . .

# Expõe a porta 8000, que é a porta padrão do Uvicorn.
EXPOSE 8000

# Comando para executar a aplicação quando o contêiner iniciar.
# Usamos "0.0.0.0" para que a aplicação seja acessível de fora do contêiner.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
