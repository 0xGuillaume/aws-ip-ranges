# Aws IP ranges

AWS is sharing public IP address used by its services for easily identify traffic from AWS. This information is helpful to allow or deny traffic to or from AWS services.

> [!NOTE]
> This tool has been primarly built to easily identify `EC2_INSTANCE_CONNECT` service CIDR to allow connection from the AWS console.

AWS current IP address are published in `JSON` format is accessible at this [address](https://ip-ranges.amazonaws.com/ip-ranges.json). For more information you can check this [documentation](https://raw.githubusercontent.com/0xGuillaume/aws-ip-ranges/main/install.sh).


## Install

If you clone the repo locally run `install.sh` under the project folder. 

```bash
./install.sh
```

Otherwise you can run the script "remotely" by curling it and then execute it.

```bash
curl https://raw.githubusercontent.com/0xGuillaume/aws-ip-ranges/main/install.sh | sh
```

## How to

Once `awsip` file **downloaded** and **installed** you can use it by querying the **service** you would like to get CIDR using the required `-s` or `--service` flag.

```bash
awsip -s SERVICE

awsip --service EC2_INSTANCE_CONNECT
```
> [!NOTE]
> Service name given **must be** uppercase.

This way CIDRs for **all** AWS regions will be printed.

```bash
# Output
10.0.0.1/29
10.0.0.2/29
10.0.0.3/29
```

If you would like to know the CIDR for a **specifi** region, use the `-r` or `--region` flag.

```bash
awsip -s EC2_INSTANCE_CONNECT -r eu-west-1
```

Finally, you can also output the full `JSON` object of an AWS service by specifying the `-f` or `--full` flag.

```bash
awsip -s EC2_INSTANCE_CONNECT -r eu-west-1 -f

awsip -s EC2_INSTANCE_CONNECT -r eu-west-1 -f | jq
```

```json
{
  "ip_prefix": "10.0.0.1/29",
  "region": "eu-west-1",
  "service": "EC2_INSTANCE_CONNECT",
  "network_border_group": "eu-west-1"
}
```
