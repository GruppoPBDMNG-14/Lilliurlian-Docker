###Lilliurlian: Guida all'installazione su Docker

Software Lilliurlian: https://github.com/GruppoPBDMNG-14/Lilliurlian

###Preparativi

- Assicurarsi di aver installato docker
- Assicurarsi di aver inoltrato la porta TCP 8080 sia lato host che lato guest sulla macchina virtuale in uso
- Avviare boot2docker o Docker Quickstart Terminal


###Installazione

1. Clonare il repository:
<pre>git clone https://github.com/GruppoPBDMNG-14/Lilliurlian-Docker</pre>

2. Entrare nel percorso:
<pre>cd Lilliurlian-Docker</pre>

3. Creare l'immagine:
<pre>docker build --tag=gruppo_pbdmng_14/lilliurlian ./</pre>

4. Creare il container: 
<pre>docker run -d --name lilliurlian -p 8080:8080 gruppo_pbdmng_14/lilliurlian</pre>

5. Entrare nel container:
<pre>docker exec -it lilliurlian bash</pre>

6. Eseguire il comando:
<pre>./start-server</pre>

Per effettuare i test JUnit eseguire il comando:
<pre>./test-server</pre>


###Accesso al client

Per accedere al client inserire questo indirizzo nel proprio browser web:
<pre>localhost:8080</pre>
