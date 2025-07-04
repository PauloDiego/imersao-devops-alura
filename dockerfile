# 1. Usar uma imagem base oficial do Python. A versão 'slim' é menor e ideal para produção.
# O readme.md especifica Python 3.10.
FROM python:3.10-alpine

# 2. Definir o diretório de trabalho dentro do container.
WORKDIR /app

# 3. Copiar o arquivo de dependências para o diretório de trabalho.
COPY requirements.txt .

# 4. Instalar as dependências do projeto.
#    --no-cache-dir: Desabilita o cache do pip para reduzir o tamanho final da imagem.
#    --upgrade pip: Garante que a versão mais recente do pip seja usada.
RUN pip install --no-cache-dir --upgrade pip -r requirements.txt

# 5. Copiar todos os arquivos do projeto para o diretório de trabalho no container.
COPY . .

# 6. Expor a porta 8000, que é a porta padrão do Uvicorn.
EXPOSE 8000

# 7. Definir o comando para executar a aplicação quando o container iniciar.
#    --host 0.0.0.0: Torna a aplicação acessível de fora do container.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]