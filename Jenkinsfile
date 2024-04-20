node {
    stage(' Git Checkout ') {
        git branch: 'main', url: 'https://github.com/musibs/k8s-jenkins-cicd.git'
    }
    stage('Send Docker file to Ansible Server') {
        sshagent(['ansible_server']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.47.2'
            sh 'scp /var/lib/jenkins/workspace/k8s-pipeline/Dockerfile ubuntu@172.31.47.2:/home/ubuntu'
        }
    }
    stage('Build the Image') {
        sshagent(['ansible_server']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.47.2'
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.47.2 && sudo docker image build -t $JOB_NAME:v1.$BUILD_ID -f /home0/ubuntu/Dockerfile'
        }
    }
}