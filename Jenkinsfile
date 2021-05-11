pipeline {
  agent {
    node {
      label "master"
    } 
  }
  
  stages {

    stage('TF Git Pull') {
      steps {
        script {
          sh "git checkout main && git pull"
        }
      }
    }

    stage('TF Init & Plan') {
      steps {
        script {
          sh "cd ${TERRAFORM_INFRA}/${TERRAFORM_PROJECT} && terraform init && terraform plan"
        }
      }      
    }

    stage('TF Approval') {
      steps {
        script {
          env.userInput = input(id: 'confirm', message: "${TERRAFORM_MODE} Terraform?", parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: "${TERRAFORM_MODE} terraform", name: 'confirm'] ])
        }
      }
    }

    stage('TF Apply / Destroy') {
      steps {
        script {
          println(userInput)
          if (userInput == "true") {
            sh "cd ${TERRAFORM_INFRA}/${TERRAFORM_PROJECT} && terraform ${TERRAFORM_MODE} -auto-approve"
          } else {
            error("Terraform not ${TERRAFORM_MODE}! Approve required!")
          }
        }
      }
    }
  }
}
