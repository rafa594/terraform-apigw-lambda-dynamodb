from __future__ import print_function # Python 2/3 compatibility
import boto3
import json
import decimal
from boto3.dynamodb.conditions import Key, Attr

# Helper class to convert a DynamoDB item to JSON.
class DecimalEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, decimal.Decimal):
            if o % 1 > 0:
                return float(o)
            else:
                return int(o)
        return super(DecimalEncoder, self).default(o)

def lambda_handler(event, context):

    dynamodb = boto3.resource('dynamodb', region_name='${aws_region}', endpoint_url='https://dynamodb.${aws_region}.amazonaws.com')

    
    
    pais = event['pais']    
    try:
        response = table.delete_item(            
            Key={
                "pais": pais
            },
            ConditionExpression="capital = :val",
            ExpressionAttributeValues= {
                ":val": capital
            }
        )
        return "Elemento " + pais + " eliminado correctamente."
    except:
        return "Ha ocurrido un error en la eliminacion del elemento " + pais    


