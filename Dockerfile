FROM python:3.11.1-alpine3.17

WORKDIR /fastapi

COPY ./requirements.txt /fastapi/requirements.txt

RUN pip install --upgrade -r /fastapi/requirements.txt

COPY ./main.py /fastapi/main.py

CMD ["uvicorn", "main:app","--reload", "--host", "0.0.0.0", "--port", "8000"]
