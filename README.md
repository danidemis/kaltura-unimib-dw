# kaltura-unimib-dw
Script per scaricare i video caricati sulla piattaforma di Moodle dell'università di Milano Bicocca. Scritto in bash, può essere eseguito su sistemi linux (compreso WSL per Windows). La modalità di fruizione del video messa a disposizione prevede la suddivisione dello stesso in tanti segmenti che poi vengono riprodotti in sequenza dal video player presente sulla pagina di Moodle, rendendo inutilizzabili le estensioni già presenti nei browser per scaricare il contenuto.

I prerequisiti per poter utilizzare lo script sono: 
    - FFMPEG (al momento della scrittura del tool v4.2); per info e download https://ffmpeg.org/download.html ;
    - Un sistema operativo compatibile;
    - Una estensione per Chrome/Chromium/Edge chiamata Video Downloader Prime (https://chrome.google.com/webstore/detail/video-downloader-prime/gipjangphphajpkddogjcpgaoiidennb);

Preparazione del tool:
  1) Scarica o clona la repository da github;
  2) In caso di download, estrai l'archivio dove preferisci;
  3) Aprire un terminale nella cartella della repo/ nella cartella in cui si è estratto lo zip scaricato al punto (1).
  4) Rendere eseguibile lo script scrivendo nel terminale: 
                          chmod +x kaltura-unimib-download.sh
  5) Assicurati di aver scaricato l'estensione per il browser prima di procedere.
  
  
Utilizzo del tool:
   1) Accedi con le tue credenziali al portale di e-learning dell'università;
   2) Apri il corso che ti interessa e fai partire il video che vuoi scaricare (e fermalo dopo un paio di secondi);
   3) Nel browser in alto a destra, dove sono presenti le estensioni, noterai che è comparso un indice azzurro con un numero (che corrisponde ai video trovati nella pagina);
   ---- È possibile notare che, cliccando sull'icona con l'indicatore numerico azzurro, compaiono una serie di Item, con relativo titolo, che rappresentano le porzioni di video che ha scaricato (il player del browser) fino a quel momento ----
   5) Selezionare uno qualsiasi dei video dall'elenco nell'estensione (che abbia il titolo del video che vi interessa scaricare) facendo click sull'icona della forbice (nella colonna "Copy") per poter ottenere il link del segmento di video.
   6) Copiato il link, aprire un terminale nella cartella dove è stata clonata la repo o dove è stato decompresso lo zip.
   7) Per eseguire lo script è necessario fornire dei parametri (alcuni reperibili dal video originale):
            -h : numero di ore del video;
            -m : numero di minuti del video;
            -s : numero di secondi del video;
            -o : nome del file di output del video una volta scaricato;
            -f : formato del video finale;
            -l : link del video (MESSO TRA VIRGOLETTE -DOPPI APICI-);
   8) Attendere che lo script faccia la sua magia.
   9) Enjoy!
   
   
Esempi di utilizzo dello script:

Video di durata 2:03:55, nome del video finale videoProva, formato del video MP4 e link "https://unimib.elearning.boh/ilmiovideo-tanticaratterisenzasenso"
     
     - [user@hostname]# ./kaltura-unimib-download.sh -h 2 -m 3 -s 55 -o videoProva -f mp4 -l "https://unimib.elearning.boh/ilmiovideo-tanticaratterisenzasenso"
     
L'unico formato video testato e funzionante è mp4.


ATTENZIONE: NON MI ASSUMO NESSUNA RESPONSABILITÀ SULL'UTILIZZO DI QUESTO STRUMENTO. I VIDEO CARICATI POTREBBERO ESSERE PROTETTI DA COPYRIGHT E LA DIFFUZIONE POTREBBE ESSERNE VIETATA. LO STRUMENTO È SOLO A SCOPO ILLUSTRATIVO. 
