node ('node_label'){
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Deploy on kubernetes') {  
             
             sh "kubectl apply -f kube.yaml" 

         }
   
   stage('Verify running pod & service') {    
       sh 'sleep 25'
       sh "kubectl -n dev get pods -l app=app1"
       sh "kubectl -n dev get svc app1"
       echo "Application deployed Successfully!!"

}
}
