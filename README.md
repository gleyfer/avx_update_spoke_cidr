# avx_update_spoke_cidr
This is a simple script to allow updating an Aviatrix Spoke VPC with new secondary CIDR ranges without having to detach/re-attach the Spoke.

## Usage

Set environment variables:

```
export AVIATRIX_CONTROLLER_IP=""
export AVIATRIX_USERNAME=""
export AVIATRIX_PASSWORD=""
```

and call the script:

```
./avx_update_spoke_cidr.sh
Spoke Gateway: spokeEast
{"return":true,"results":"Gateway spokeEast real VPC CIDRs changed to ['10.32.2.0/24', '100.64.0.0/16', '100.65.0.0/16'] successfully."}%
```

Or provide the arguments directly when invoking the script:

```
./avx_update_spoke_cidr.sh 1.2.3.4 admin yourPassword
Spoke Gateway: spokeEast
{"return":true,"results":"Gateway spokeEast real VPC CIDRs changed to ['10.32.2.0/24', '100.64.0.0/16', '100.65.0.0/16'] successfully."}%
```
