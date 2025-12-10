FROM python:3.11-slim

# рабочая директория
WORKDIR /app

# зависимости
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# копируем код
COPY . .

# запускаем gunicorn
CMD ["gunicorn", "-w", "1", "-k", "gevent", "--timeout", "300", "-b", "0.0.0.0:8080", "app:app"]