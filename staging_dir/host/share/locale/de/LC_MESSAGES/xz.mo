??   ?   0      ?   ?	          ,  8      ?  ?   ?  7  ?  ?  ?  -   ?  F   ?          -  7   ?  ?   w  ?     ?   ?  I   ?  ?   
  ?   ?  ?   ?  ?    H   ?       E   ?  ?   ?    y  >   ?  ?   ?  9   \  ?   ?  ?   ,  ?   ?  ?   3   ?   !  ?   ?!  l   S"     ?"     ?"     ?"     #     ,#     L#     f#     ?#     ?#  z   ?#     /$     I$     c$  .   u$  6   ?$     ?$     ?$     %     %  !   %  !   ?%  '   a%     ?%     ?%     ?%  *   ?%  /   &  %   C&     i&  /   {&  ,   ?&     ?&  4   ?&  $   #'     H'     d'     ?'     ?'     ?'      ?'      ?'  h   (  <   {(     ?(  :   ?(  &   )  $   -)     R)  2   m)     ?)  $   ?)  /   ?)  I   *     \*     p*  3   ?*  =   ?*  6   ?*  d   /+  [   ?+      ?+  O   ,  .   a,  /   ?,     ?,  A   ?,  )   -     G-     P-     i-  ;   ?-  <   ?-  8   ?-  6   5.     l.     ?.  (   ?.  I   ?.  !   /  '   1/  '   Y/  9   ?/     ?/     ?/  0   ?/     
0  <   0  -   L0  @   z0  8   ?0  >   ?0  /   31  7   c1  D   ?1  5   ?1  &   2  '   =2     e2  %   m2     ?2     ?2  
   ?2  
   ?2  
   ?2  
   ?2  
   ?2  	   ?2  	   ?2  	   3  	   3  	   3  	   "3  	   ,3  "   63  *   Y3     ?3  A   ?3  Q   ?3  *   ,4  @   W4  !   ?4     ?4  {  ?4    :6  \  A7  ?  ?;  :   ?=  O   ?=     )>     E>  g   Y>  ?   ?>  ?   ??  ?  ?@  S   $B  =   xB    ?B  ?   ?C    ?D  l   ?F  ?   G  F   ?G  ?   ?G  H  ?H  B   J    SJ  >   YK  ?   ?K  ?   pL  ?   M  4  ?M  	  	O  ?   P  q   ?P     MQ     iQ     ?Q     ?Q      ?Q     ?Q     ?Q     R     7R  ?   SR     ?R     ?R     S  -    S  >   NS     ?S     ?S     ?S     ?S  &   ?S  +   ?S  (   *T  (   ST  (   |T  (   ?T  /   ?T  >   ?T  .   =U     lU  J   U  1   ?U     ?U  ;   V  *   NV     yV     ?V     ?V      ?V     ?V  %    W  '   &W  ^   NW  S   ?W     X  H   X  (   ]X  .   ?X     ?X  /   ?X     Y  -   !Y  ,   OY  f   |Y     ?Y     ?Y  2   Z  H   BZ  2   ?Z  y   ?Z  i   8[      ?[  m   ?[  <   1\  D   n\     ?\  F   ?\  ,   ]     G]     S]  %   q]  9   ?]  9   ?]  G   ^  J   S^     ?^     ?^  4   ?^  U   _     Z_  ,   w_  ,   ?_  I   ?_     `     3`  C   8`     |`  K   ?`  ?   ?`  B   Oa  8   ?a  Q   ?a  2   b  4   Pb  V   ?b  6   ?b  .   c  +   Bc     nc  2   vc     ?c     ?c     ?c     ?c     ?c     ?c     ?c     d     d     d     d     #d     +d     3d  ,   ;d     hd     ?d  Z   ?d  T   ?d  @   Pe  E   ?e  0   ?e     f     ?   w       1   N                 ?   5           D   $       g               i   ?   z   |   ?   >   ?              R       
      S   T   4   0   ?   f   X          ]   O   ?       ?       v       j             K       s             [   I   p       B       h       2             ?   ;       ,          ?   ?   r   `   '      H   a          @           <   t   .   V   Q          }   u   n   Y       +   {   Z   C           /      #   *      F   ?   e   "       m       )   %       E           !              J   ?           ?      -      =   ?       ?         \           9          ?   ?   ~       _      :   L       o   	   l   7             M          G   A   c       U   ?       3   q                  6   8   ?       ?   y   d       W       P       k   (      b   ?   ?   x   ?   &   ?   ?   ?   ?   ^      f     f  D  X  l  ?  ?  ?  f         
   ????0f  2          ????cf  0               ?????f         
   ?????f  [          ????g  '               ???? 
  --delta[=OPTS]      Delta filter; valid OPTS (valid values; default):
                        dist=NUM   distance between bytes being subtracted
                                   from each other (1-256; 1) 
  --lzma1[=OPTS]      LZMA1 or LZMA2; OPTS is a comma-separated list of zero or
  --lzma2[=OPTS]      more of the following options (valid values; default):
                        preset=PRE reset options to a preset (0-9[e])
                        dict=NUM   dictionary size (4KiB - 1536MiB; 8MiB)
                        lc=NUM     number of literal context bits (0-4; 3)
                        lp=NUM     number of literal position bits (0-4; 0)
                        pb=NUM     number of position bits (0-4; 2)
                        mode=MODE  compression mode (fast, normal; normal)
                        nice=NUM   nice length of a match (2-273; 64)
                        mf=NAME    match finder (hc3, hc4, bt2, bt3, bt4; bt4)
                        depth=NUM  maximum search depth; 0=automatic (default) 
  --x86[=OPTS]        x86 BCJ filter (32-bit and 64-bit)
  --powerpc[=OPTS]    PowerPC BCJ filter (big endian only)
  --ia64[=OPTS]       IA-64 (Itanium) BCJ filter
  --arm[=OPTS]        ARM BCJ filter (little endian only)
  --armthumb[=OPTS]   ARM-Thumb BCJ filter (little endian only)
  --sparc[=OPTS]      SPARC BCJ filter
                      Valid OPTS for all BCJ filters:
                        start=NUM  start offset for conversions (default=0) 
 Basic file format and compression options:
 
 Custom filter chain for compression (alternative for using presets): 
 Operation modifiers:
 
 Other options:
 
With no FILE, or when FILE is -, read standard input.
       --block-list=SIZES
                      start a new .xz block after the given comma-separated
                      intervals of uncompressed data       --block-size=SIZE
                      start a new .xz block after every SIZE bytes of input;
                      use this to set the block size for threaded compression       --flush-timeout=TIMEOUT
                      when compressing, if more than TIMEOUT milliseconds has
                      passed since the previous flush and reading more input
                      would block, all pending data is flushed out       --ignore-check  don't verify the integrity check when decompressing       --info-memory   display the total amount of RAM and the currently active
                      memory usage limits, and exit       --memlimit-compress=LIMIT
      --memlimit-decompress=LIMIT
  -M, --memlimit=LIMIT
                      set memory usage limit for compression, decompression,
                      or both; LIMIT is in bytes, % of RAM, or 0 for defaults       --no-adjust     if compression settings exceed the memory usage limit,
                      give an error instead of adjusting the settings downwards       --no-sparse     do not create sparse files when decompressing
  -S, --suffix=.SUF   use the suffix `.SUF' on compressed files
      --files[=FILE]  read filenames to process from FILE; if FILE is
                      omitted, filenames are read from the standard input;
                      filenames must be terminated with the newline character
      --files0[=FILE] like --files but use the null character as terminator       --robot         use machine-parsable messages (useful for scripts)       --single-stream decompress only the first stream, and silently
                      ignore possible remaining input data       CheckVal %*s Header  Flags        CompSize    MemUsage  Filters   -0 ... -9           compression preset; default is 6; take compressor *and*
                      decompressor memory usage into account before using 7-9!   -F, --format=FMT    file format to encode or decode; possible values are
                      `auto' (default), `xz', `lzma', and `raw'
  -C, --check=CHECK   integrity check type: `none' (use with caution),
                      `crc32', `crc64' (default), or `sha256'   -Q, --no-warn       make warnings not affect the exit status   -T, --threads=NUM   use at most NUM threads; the default is 1; set to 0
                      to use as many threads as there are processor cores   -V, --version       display the version number and exit   -e, --extreme       try to improve compression ratio by using more CPU time;
                      does not affect decompressor memory requirements   -h, --help          display the short help (lists only the basic options)
  -H, --long-help     display this long help and exit   -h, --help          display this short help and exit
  -H, --long-help     display the long help (lists also the advanced options)   -k, --keep          keep (don't delete) input files
  -f, --force         force overwrite of output file and (de)compress links
  -c, --stdout        write to standard output and don't delete input files   -q, --quiet         suppress warnings; specify twice to suppress errors too
  -v, --verbose       be verbose; specify twice for even more verbose   -z, --compress      force compression
  -d, --decompress    force decompression
  -t, --test          test compressed file integrity
  -l, --list          list information about .xz files   Blocks:
    Stream     Block      CompOffset    UncompOffset       TotalSize      UncompSize  Ratio  Check   Blocks:             %s
   Check:              %s
   Compressed size:    %s
   Memory needed:      %s MiB
   Minimum XZ Utils version: %s
   Number of files:    %s
   Ratio:              %s
   Sizes in headers:   %s
   Stream padding:     %s
   Streams:
    Stream    Blocks      CompOffset    UncompOffset        CompSize      UncompSize  Ratio  Check      Padding   Streams:            %s
   Uncompressed size:  %s
  Operation mode:
 %s MiB of memory is required. The limit is %s. %s MiB of memory is required. The limiter is disabled. %s file
 %s files
 %s home page: <%s>
 %s:  %s: Cannot remove: %s %s: Cannot set the file group: %s %s: Cannot set the file owner: %s %s: Cannot set the file permissions: %s %s: Closing the file failed: %s %s: Error reading filenames: %s %s: Error seeking the file: %s %s: File already has `%s' suffix, skipping %s: File has setuid or setgid bit set, skipping %s: File has sticky bit set, skipping %s: File is empty %s: File seems to have been moved, not removing %s: Filename has an unknown suffix, skipping %s: Filter chain: %s
 %s: Input file has more than one hard link, skipping %s: Invalid argument to --block-list %s: Invalid filename suffix %s: Invalid multiplier suffix %s: Invalid option name %s: Invalid option value %s: Is a directory, skipping %s: Is a symbolic link, skipping %s: Not a regular file, skipping %s: Null character found when reading filenames; maybe you meant to use `--files0' instead of `--files'? %s: Options must be `name=value' pairs separated with commas %s: Read error: %s %s: Seeking failed when trying to create a sparse file: %s %s: Too many arguments to --block-list %s: Too small to be a valid .xz file %s: Unexpected end of file %s: Unexpected end of input when reading filenames %s: Unknown file format type %s: Unsupported integrity check type %s: Value is not a non-negative decimal integer %s: With --format=raw, --suffix=.SUF is required unless writing to stdout %s: Write error: %s %s: poll() failed: %s --list does not support reading from standard input --list works only on .xz files (--format=xz or --format=auto) 0 can only be used as the last element in --block-list Adjusted LZMA%c dictionary size from %s MiB to %s MiB to not exceed the memory usage limit of %s MiB Adjusted the number of threads from %s to %s to not exceed the memory usage limit of %s MiB Cannot establish signal handlers Cannot read data from standard input when reading filenames from standard input Compressed data cannot be read from a terminal Compressed data cannot be written to a terminal Compressed data is corrupt Compression and decompression with --robot are not supported yet. Decompression will need %s MiB of memory. Disabled Empty filename, skipping Error creating a pipe: %s Error getting the file status flags from standard input: %s Error getting the file status flags from standard output: %s Error restoring the O_APPEND flag to standard output: %s Error restoring the status flags to standard input: %s File format not recognized Internal error (bug) LZMA1 cannot be used with the .xz format Mandatory arguments to long options are mandatory for short options too.
 Maximum number of filters is four Memory usage limit for compression:     Memory usage limit for decompression:   Memory usage limit is too low for the given filter setup. Memory usage limit reached No No integrity check; not verifying file integrity None Only one file can be specified with `--files' or `--files0'. Report bugs to <%s> (in English or Finnish).
 Strms  Blocks   Compressed Uncompressed  Ratio  Check   Filename Switching to single-threaded mode due to --flush-timeout THIS IS A DEVELOPMENT VERSION NOT INTENDED FOR PRODUCTION USE. The .lzma format supports only the LZMA1 filter The environment variable %s contains too many arguments The exact options of the presets may vary between software versions. The filter chain is incompatible with --flush-timeout The sum of lc and lp must not exceed 4 Total amount of physical memory (RAM):  Totals: Try `%s --help' for more information. Unexpected end of input Unknown error Unknown-11 Unknown-12 Unknown-13 Unknown-14 Unknown-15 Unknown-2 Unknown-3 Unknown-5 Unknown-6 Unknown-7 Unknown-8 Unknown-9 Unsupported LZMA1/LZMA2 preset: %s Unsupported filter chain or filter options Unsupported options Unsupported type of integrity check; not verifying file integrity Usage: %s [OPTION]... [FILE]...
Compress or decompress FILEs in the .xz format.

 Using a preset in raw mode is discouraged. Valid suffixes are `KiB' (2^10), `MiB' (2^20), and `GiB' (2^30). Writing to standard output failed Yes Project-Id-Version: XZ Utils 4.999.9beta
Report-Msgid-Bugs-To: lasse.collin@tukaani.org
POT-Creation-Date: 2015-02-26 16:55+0200
PO-Revision-Date: 2010-09-07 20:27+0200
Last-Translator:  <maan@tuebingen.mpg.de>
Language-Team: German
Language: de
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
 
  --delta[=OPTIONEN]    Delta Filter; zulässige Optionen (gültige Werte;
                        Voreinstellung):
                          dist=NUM  Abstand zwischen den Bytes, die voneinander
                                    subtrahiert werden (1-256; 1) 
  --lzma1[=OPTIONEN]    LZMA1 oder LZMA2; OPTIONEN ist eine durch Kommata
  --lzma2[=OPTIONEN]    getrennte Liste bestehend aus den folgenden Optionen
                        (zulässige Werte; Voreinstellung):
                          preset=NUM Setze Optionen zurück zu Voreinstellung
                                     (0-9[e])
                          dict=NUM   Wörterbuch Größe (4 KiB - 1536 MiB; 8 MiB)
                          lc=NUM     Anzahl der Literal Kontext Bits (0-4; 3)
                          lp=NUM     Anzahl der Literal Positionsbits (0-4; 0)
                          pb=NUM     Anzahl der Positionsbits (0-4; 2)
                          mode=MODUS Kompressionsmodus (fast, normal; normal)
                          nice=NUM   Nice-Länge eines Treffers (2-273; 64)
                          mf=NAME    Algorithmus zum Auffinden von
                                     Übereinstimmungen (hc3, hc4, bt2, bt3, bt4;
                                     bt4)
                          depth=NUM  Maximale Suchtiefe; 0=automatisch
                                     (Voreinstellung) 
  --x86[=OPTIONEN]      x86 BCJ Filter (32-bit und 64-bit)
  --powerpc[=OPTIONEN]  PowerPC BCJ Filter (nur big endian)
  --ia64[=OPTIONEN]     IA64 (Itanium) BCJ Filter
  --arm[=OPTIONEN]      ARM BCJ Filter (nur little endian)
  --armthumb[=OPTIONEN] ARM-Thumb BCJ Filter (nur little endian)
  --sparc[=OPTIONEN]    SPARC BCJ Filter
                        Zulässige Optionen für alle BCJ Filter:
                          start=NUM  Start-Offset für Konversion
                          (Voreinstellung=0) 
 Grundlegende Optionen für Dateiformat und Kompression:
 
 User-definierte Filter Kette für Kompression (alternativ zu Voreinstellung): 
 Operationsmodifikatoren:
 
 Andere Optionen:
 
Wenn DATEI nicht angegeben wurde, oder DATEI gleich - ist, dann wird von
der Standardeingabe gelesen.
       --block-list=GRÖßEN
                        beginne einen neuen .xz Block gemäß der angegebenen,
                        durch Kommata getrennten Intervalle an unkomprimierten
                        Daten       --block-size=GRÖßE
                        beginne einen neuen .xz Block nach GRÖßE Input Bytes;
                        Benutzen Sie diese Option um die Block Größe für
                        Kompression mit mehreren Threads zu setzen       --flush-timeout=ZEITÜBERSCHREITUNG
                        wenn beim Komprimieren mehr als ZEITÜBERSCHREITUNG
                        Millisekunden vergangen sind seit der letzten Flush
                        Operation, und das Lesen von zusätzlichem Input den
                        Prozess blockieren würde, dann werden alle noch aus-
                        stehenden Daten geschrieben      --ignore-check     überprüfe nicht den Integritätscheck beim Dekomprimieren       --info-memory     zeige Speicherlimit an und terminiere       --memlimit-compress=LIMIT
      --memlimit-decompress=LIMIT
  -M, --memlimit=LIMIT  Setze Speicher Nutzungslimit für Kompression,
                        Dekompression, oder beides; LIMIT ist in bytes, % RAM,
                        oder 0 für Grundeinstellungen.       --no-adjust       Wenn die Kompressionseinstellungen das Speicher
                        Nutzungslimit übersteigen, erzeuge einen Fehler statt
                        die Einstellungen nach unten anzupassen.       --no-sparse       erzeuge keine sparse Datei beim Dekomprimieren
  -S, --suffix=.SUF     benutze `.SUF' Endung für komprimierte Dateien
      --files=[DATEI]   lese zu verarbeitende Dateinamen von DATEI; falls
                        DATEI nicht angegeben wurde, werden Dateinamen
                        von Standard Input gelesen. Dateinamen müssen mit
                        einem Zeilenumbruch voneinander getrennt werden
      --files0=[DATEI]  wie --files, aber benutze den Null Charakter als Trenner       --robot           benutze Maschinen-lesbare Meldungen (nützlich für
                        Skripte)       --single-stream   dekomprimiere nur den ersten Datenstrom und ignoriere
                        stillschweigend mögliche weitere Eingabedaten       CheckWert %*s  Kopf  Schalter    KompGröße    Speicher  Filter   -0 .. -9              Kompressionseinstellung; Voreinstellung is 6. Beachten
                        Sie den Speicherverbrauch des Komprimieres *und* des
                        Dekomprimierers, wenn Sie 7-9 benutzen!   -F, --format=FMT      Dateiformat zur Kodierung oder Dekodierung; mögliche
                        Werte sind `auto' (Voreinstellung), `xz', `lzma' und
                        `raw'
  -C, --check=CHECK     Typ des Integritätschecks: `none' (Vorsicht), `crc32',
                        `crc64' (Voreinstellung), oder `sha256'   -Q, --no-warn         Warnungen verändern nicht den exit status   -T, --threads=ZAHL    erzeuge höchstens ZAHL viele Threads; die Grund-
                        einstellung ist 1. Wenn der Wert 0 angegeben wird, dann
                        werden so viele Threads erzeugt wie es Prozessor Kerne
                        gibt   -V, --version         zeige Versionsnummer an und terminiere   -e, --extreme         Versuche durch stärkere CPU Nutzung das Kompressions-
                        verhältnis zu verbessern. Das beeinflusst nicht den
                        Speicherbedarf des Dekomprimierers.   -h, --help            zeige kurze Hilfe and (zeigt nur die grundlegenden
                        Optionen)
  -H, --long-help       zeige diese lange Hilfe an und terminiere   -h, --help            zeige diese kurze Hilfe an und terminiere
  -H, --long-help       zeige die lange Hilfe an (zeigt auch fortgeschrittene
                        Optionen an)   -k, --keep            Eingabedateien beibehalten (nicht löschen)
  -f, --force           erzwinge Überschreiben der Ausgabedatei und
                        (de)komprimiere Verweise (Links)
  -c, --stdout          schreibe nach Standard Output und lösche nicht die
                        Eingabedateien   -q, --quiet           unterdrücke Warnungen; benutze diese Option zweimal
                        um auch Fehlermeldungen zu unterdrücken
  -v, --verbose         sei gesprächig; benutze diese Option zweimal um noch
                        gesprächiger zu sein   -z, --compress        erzwinge Komprimierung
  -d, --decompress      erzwinge Dekomprimierung
  -t, --test            überprüfe Datei Integrität
  -l, --list            liste Datei Informationen   Blöcke:
     Strom     Block      KompOffset    UnkompOffset      TotalGröße     UnkompGröße  Verh.  Check   Blöcke:              %s
   Check:               %s
   Größe komprimiert:   %s
   Benötigter Speicher: %s MiB
   Kleinste XZ Utils version: %s
    Anzahl Dateien:     %s
   Verhältnis:          %s
   Größe in Köpfen:     %s
   Strom Auffüllung:    %s
   Ströme:
     Strom    Blöcke      KompOffset    UnkompOffset       KompGröße     UnkompGröße  Verh.  Check   Auffüllung   Ströme:              %s
   Größe unkomprimiert: %s
  Operationsmodus:
 %s MiB Speicher wird benötigt. Limit ist %s. %s MiB Speicher wird benötigt. Der Begrenzer ist deaktiviert. %s Datei
 %s Dateien
 %s Homepage: <%s>
 %s:  %s: Kann nicht löschen: %s %s: Kann Datei Gruppe nicht setzen: %s %s: Kann Datei Eigentümer nicht setzen: %s %s: Kann Zugriffsrechte nicht setzen: %s %s: Fehler beim Schließen der Datei: %s %s: Fehler beim Lesen der Dateinamen: %s %s: Fehler beim Lesen der Dateinamen: %s %s: Datei hat bereits `%s' Endung, überspringe %s: Datei hat das setuid oder setgid Bit gesetzt, überspringe %s: Datei hat sticky Bit gesetzt, überspringe %s: Datei ist leer %s: Datei scheint umbenannt worden zu sein, daher wird sie nicht gelöscht %s: Dateiname hat unbekannte Endung, überspringe %s: Filter Kette: %s
 %s: Eingabedatei hat mehr als einen hard link, überspringe %s: Ungültiges Argument für --block-list %s: Ungültige Datei Endung %s: Ungültige Einheit %s: Ungültige Option %s: Ungültiger Wert für Option %s: Überspringe Verzeichnis %s: Überspringe symbolischen Verweis %s: Keine reguläre Datei, überspringe %s: Null Charakter gefunden beim Lesen der Dateinamen; Meinten Sie `--files0' statt `--files'? %s: Optionen müssen in der Form `Name=Wert` gegeben werden, getrennt durch Kommata %s: Lesefehler: %s %s: Positionierungsfehler beim Versuch eine sparse Datei zu erzeugen: %s %s: Zu viele Argumente für --block-list %s: Zu klein um ein gültiges .xz file zu sein %s: Unerwartetes Ende der Datei %s: Unerwartetes Ende beim Lesen der Dateinamen %s: Unbekanntes file format %s: Integritäts-Check Typ nicht unterstützt %s: Wert ist keine nicht-negative ganze Zahl %s: Mit --format=raw ist --suffix=.SUF notwendig, falls nicht auf die Standardausgabe geschrieben wird %s: Schreibfehler: %s %s: poll() Fehler: %s --list unterstützt kein Lesen der Standardeingabe --list funktioniert nur mit .xz Dateien (--format=xz oder --format=auto) 0 kann nur das letzte Element in --block-list sein Passte LZMA%c Wörterbuch Größe von %s MiB to %s MiB an, um nicht das Speicher Nutzungslimit von %s MiB zu übersteigen Passte die Anzahl Threads von %s auf %s an um nicht das Speicher Nutzungslimit von %s MiB zu übersteigen Kann Signal Routine nicht setzen Lesen der Standardeingabe ist nicht möglich, wenn die Dateinamen auch von der Standardeingabe gelesen werden Komprimierte Daten können nicht vom Terminal gelesen werden Komprimierte Daten können nicht auf das Terminal geschrieben werden Komprimierte Daten sind korrupt Kompression und Dekompression mit --robot ist noch nicht unterstützt. Dekompression wird %s MiB Speicher brauchen. Deaktiviert Leere Dateiname, überspringe Fehler beim Erzeugen der Pipeline: %s Kann Status Flags der Standardeingabe nicht ermitteln: %s Kann Status Flags der Standardausgabe nicht ermitteln: %s Fehler beim Wiederherstellen des O_APPEND flags bei Standard Output: %s Fehler beim Wiederherstellen der Status Flags für die Standardausgabe: %s Datei Format nicht erkannt Interner Fehler (Bug) LZMA1 kann nicht mit dem .xz Format verwendet werden Obligatorische Argumente für lange Optionen sind auch für kurze Optionen
zwingend.
 Maximal vier Filter möglich Speicher Nutzungslimit für Kompression:     Speicher Nutzungslimit für Dekompression:   Das Speicher Limit ist zu niedrig für die gegebene Filter Konfiguration. Speicher-Limit erreicht Nein Kein Integritäts-Check; werde Datei-Integrität nicht überprüfen Kein Nur ein file kann als Argument für --files oder --files0 angegeben werden. Melde Bugs an <%s> (in englisch oder finnisch).
Melde Übersetzungsfehler an <maan@tuebingen.mpg.de> (in englisch oder deutsch).
  Str.  Blöcke       Kompr.     Unkompr.  Verh.  Check   Dateiname Schalte um auf Single-Thread Modus wegen --flush-timeout DAS IST EINE ENTWICKLERVERSION, DIE NICHT FÜR DEN PRODUKTIVBETRIEB GEEIGNET IST. Das .lzma Format unterstützt nur den LZMA1 Filter Die Umgebungsvariable %s enthält zu viele Argumente Die genauen Optionen der Voreinstellung können zwischen Software Versionen variieren. Diese Filter Kette ist inkompatibel zu --flush-timeout Die Summe aus lc und lp darf höchstens 4 sein Gesamtmenge physikalischer Speicher (RAM):  Gesamt: Versuchen Sie `%s --help' für mehr Informationen. Unerwartetes Eingabe Ende Unbekannter Fehler Unbek.11 Unbek.12 Unbek.13 Unbek.14 Unbek.15 Unbek.2 Unbek.3 Unbek.5 Unbek.6 Unbek.7 Unbek.8 Unbek.9 LZMA1/LZMA2 Voreinstellung ist ungültig: %s Optionen nicht unterstützt Optionen nicht unterstützt Typ des Integritäts-Checks nicht unterstützt; werde Datei-Integrität nicht überprüfen Benutzung: %s [OPTION]... [DATEI]...
Komprimiert oder dekomprimiert .xz DATEI(EN).

 Verwendung der Voreinstellung im raw Modus wird nicht empfohlen. Gültige Einheiten sind `KiB' (2^10), `MiB' (2^20), und `GiB' (2^30). Schreiben auf die Standardausgabe fehlgeschlagen Ja PRIu32 PRIu64 Using up to % threads. The selected match finder requires at least nice=% Value of the option `%s' must be in the range [%, %] Benutze bis zu % Threads. Der ausgewählte Algorithmus zum Auffinden von Übereinstimmungen braucht mindestens nice=% Wert der Option `%s' muss im Bereich [%, %] sein 