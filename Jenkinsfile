node{
    
    stage("clean workspace"){
        deleteDir()
    }
    
    stage("code checkout"){
        git "https://github.com/vijayalakshmipushpendra/php-registration.git"
    }
    
    stage("build"){
        sh "docker build -t vijayalakshmipushpendra/php-registration:1.0 ."
    }
    
    stage("Push to DockerHub"){
        withCredentials([string(credentialsId: 'dockerpassword', variable: 'dockerhubPassword')]) {
      sh "docker login -u vijayalakshmipushpendra -p ${dockerhubPassword}"
      sh "docker push vijayalakshmipushpendra/php-registration:1.0"
        }
    }
    
    stage("deploy"){
   ansiblePlaybook become: true, credentialsId: 'ansible-sshjenkins-key', disableHostKeyChecking: true, installation: 'ansible', inventory: '/etc/ansible/hosts', playbook: 'playbook1.yml', vaultTmpPath: ''
    }
 }
