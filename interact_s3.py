import boto3
import pandas as pd
from pyspark.sql.functions import mean, max, min, col, count
from pyspark.sql import SparkSession

    # Criando client para interação no AWS S3
s3_client = boto3.client('s3')

spark = (
    SparkSession.builder.appName('ExerciseSpark')
    .getOrCreate()
)

enem = (
    spark
    .read
    .format('csv')
    .option('header', True)
    .option('inferSchema', True)
    .option('delimiter', ';')
    .load('s3://datalake-tamyrispiva-8271-8674-4687/raw-data/enem/')
)


enem = (
    spark
    .write
    .mode('overwrite')
    .format('parquet')
    .partitionBy('year')
    .save('s3://datalake-tamyrispiva-8271-8674-4687/staging/enem/')
)






#s3_client.download_file('datalake-tamyrispiva-8271-8674-4687',
#                        'raw-data/ITENS_PROVA_2020.csv',
#                        'data/ITENS_PROVA_2020.csv')
#
##df = pd.read_csv('data/ITENS_PROVA_2020.csv', sep=';')
##print(df)
#
#    # Fazendo upload no bucket
#
#s3_client.upload_file('data/ITENS_PROVA_2020.csv',
                      #'datalake-tamyrispiva-8271-8674-4687',
                      #'raw-data/ITENS_ENEM_PROVA.csv')

