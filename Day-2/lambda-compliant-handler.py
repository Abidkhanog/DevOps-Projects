def lambda_handler(event, context):
    print("Aws config triggered this Lambda")

    return {
            "compilance_type": "NON_COMPLIANT"
            "annotation": "Cheked by Lambda"
            }
