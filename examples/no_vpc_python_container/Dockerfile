FROM public.ecr.aws/lambda/python:3.9
COPY lambda.py ${LAMBDA_TASK_ROOT}
COPY requirements.txt  .
RUN  pip3 install -r requirements.txt -t "${LAMBDA_TASK_ROOT}"
CMD ["lambda.handler"]
