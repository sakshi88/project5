echo deploymentStatus.txt
status=$(grep -i eksctl-capstone deploymentStatus.txt | wc -l)
if [[ $status -gt 0 ]]
    then 
    echo "Skipping... as Infrastructure Exists"
    else
    echo "starting Creating Kubernetes cluster"
    eksctl create cluster --name capstone --region $AWS_DEFAULT_REGION --version 1.19  --nodegroup-name capstone-ng --node-type t3.large --nodes-min 2 --nodes-max 2 --managed
    echo "cluster created"
fi