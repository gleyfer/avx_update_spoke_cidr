ControllerIP=${1:-$AVIATRIX_CONTROLLER_IP}
ControllerUser=${2:-$AVIATRIX_USERNAME}
ControllerPW=${3:-$AVIATRIX_PASSWORD}

# Get the primary spoke gateway name to update CIDR
read -p 'Spoke Gateway: ' GWName

if [[ ($# -ne 3) && (-z $ControllerIP || -z $ControllerPW || -z $ControllerUser) ]]
then
	echo "\nPlease set environment variables or provide arguments\n"
	exit 1
fi

# Get CID
CID=`curl -s -k --location --request POST "https://$ControllerIP/v1/api" \
--form 'action=login' \
--form "username=$ControllerUser" \
--form "password=$ControllerPW" | grep -o 'CID.*'|cut -d'"' -f3`

# Update Spoke CIDR
curl -s -k --location --request POST "https://$ControllerIP/v1/api" \
--form "action=update_encrypted_spoke_vpc_cidrs" \
--form "CID=$CID" \
--form "gateway_name=$GWName"
