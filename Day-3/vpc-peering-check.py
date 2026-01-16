import boto3

# Create EC2 client with region
ec2 = boto3.client('ec2', region_name='ap-south-1')

response = ec2.describe_vpc_peering_connections()

for peer in response['VpcPeeringConnections']:
    print("---------------")
    print("Peering ID :", peer['VpcPeeringConnectionId'])
    print("Status     :", peer['Status']['Code'])
    print("Requester  :", peer['RequesterVpcInfo']['CidrBlock'])
    print("Accepter   :", peer['AccepterVpcInfo']['CidrBlock'])

