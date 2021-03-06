pokud ma cesta mezery nebo dlouha jmena pouzij dvojty string

DOSCommand  "\"" + "C:\Program Files\Autodesk\3DsMax" + "\""

fn copyDirTree indir outdir hidden:true exceptempty:false owerwritereadonly:true existingonly:false silent:true =
(
	--check path end slash
	trimRight inpath "c:\\temp/" "\\/"
	trimRight outpath "c:\\temp/" "\\/"
	inpath  += "\\"
	outpath += "\\"
	
	local cmd = "XCOPY   /I " +
		(if exceptempty       then "/S " else "/E ") + 
		(if hidden            then "/H " else ""  ) + 
		(if owerwritereadonly then "/R " else ""  ) + 
		(if existingonly      then "/U " else ""  ) + 
		(if silent            then "/Y " else " "  ) + 
		indir + " " + outdir

	format "cmd:%\n" cmd
	DOSCommand cmd
)

copyDirTree "C:\\Temp\\test" "C:\\Temp\\test2" exceptempty:true

XCOPY
/E           Copies directories and subdirectories, including empty ones.
/S           Copies directories and subdirectories except empty ones.
/I           If destination does not exist and copying more than one file,
               assumes that destination must be a directory.
/H           Copies hidden and system files also.
/R           Overwrites read-only files.
/Y           Suppresses prompting to confirm you want to overwrite an
             existing destination file.
/D:m-d-y     Copies files changed on or after the specified date.
             If no date is given, copies only those files whose
             source time is newer than the destination time.
/T           Creates directory structure, but does not copy files. Does not
              include empty directories or subdirectories. /T /E includes
              empty directories and subdirectories.
/U           Copies only files that already exist in destination.
			  
			  

DOSCommand ("ren " + FolderName + " \""  +  text + "\"") --rename dir
DOSCommand ("rd /s /q \"" + FolderPath + "\"") --deleteFile dir tree

or

DOSCommand ( "rd "+"\""+Path+"\""+" /s /q")


DOSCommand "delete c:\\temp\\foo.dat"
DOSCommand "del D:\\3dsmax7\\shaders\\.svn\\*.*"

Deletes one or more files.

DEL [/P] [/F] [/S] [/Q] [/A[[:]attributes]] names
ERASE [/P] [/F] [/S] [/Q] [/A[[:]attributes]] names
names	Specifies a list of one or more files or directories. Wildcards may be used to delete multiple files. If a directory is specified, all files within the directory will be deleted.
/P	Prompts for confirmation before deleting each file.
/F	Force deleting of read-only files.
/S	Delete specified files from all subdirectories.
/Q	Quiet mode, do not ask if ok to delete on global wildcard
/A	Selects files to delete based on attributes
attributes	

R  Read-only files            S  System files
H  Hidden files               A  Files ready for archiving
-  Prefix meaning not


Syntax:

MOVE [/Y|/-Y] [d:][path]filename[,[d:][path]filename[...]] destination

Purpose: Moves one or more files to the location you specify. Can also be used to rename directories.
Discussion

To move a file or files, you specify the name and location of the file or 
files you want to move followed by the destination. The destination specifies the new location of the file, 
or the new name of the directory. The destination can consist of a drive letter followed by a colon, a directory name, 
or a combination. If you are moving only one file, you can also specify a filename. If you are moving more than one file, 
the destination must be a directory name. 
If you move a file to an existing file, it will be overwritten.
Options

/Y - Use this option if you want MOVE to replace existing file(s) without prompting you for a confirmation. 
Otherwise, the replacement will not be made until you confirm it. If you use MOVE as part of a batch file, 
existing files will be replaced without a confirmation prompt. This option will override all defaults as well as 
the current setting of the COPYCMD environment variable.

/-Y - Use this option if you want MOVE to provide a confirmation prompt before replacing an existing file. 
This option will override all defaults as well as the current setting of the COPYCMD environment variable.

Examples

If you want to move two files named LETTER1 and LETTER2 from the current directory to the \MEMOS directory on drive C, enter the following:

move letter1, letter2 c:\memos

To rename the 89MEMOS directory on drive C to 90MEMOS, enter the following:

move c:\89memos c:\90memos



Windows95 obsahuje tyto DOS pr(�kazy:

 

attrib                                                   nastaven� pr(�znaku* souboru* (extern�)

break                                                  nastaven� rozezn�n� Ctrl+C

cd                                                        zme(na/zobrazen� aktu�ln� adres�r(e

chcp                                                   zobrazen�/zme(na aktu�ln� k�dov� str�nky

chdir                                                   tot� co cd

chkdsk                                               kontrola stavu disku, doporuc(en� n�hrada - scandskw, (extern�)

cls                                                       smaz�n� obsahu obrazovky

command                                           spu�te(n� nov�ho COMMAND.COM, (extern�)

copy                                                   kop�rov�n� souboru*

ctty                                                     zme(na pou�it�ho termin�lov�ho zar(�zen�

date                                                    zobrazen�/nastaven� syst�mov�ho data

drvspace                                            komprimace disku*
, (extern�)

debug                                                 lad�c� program
, (extern�)

defrag                                                 defragmentace disku, (extern�)

del                                                       maz�n� souboru*

deltree                                                maz�n� adres�r(u*, (extern�)

dir                                                       zobrazen� obsahu adres�r(u*

diskcopy                                            kop�rov�n� disket, (extern�)

doskey                                               zaveden� historie DOS pr(�kazu*, (extern�)

edit                                                     textov� editor pro ASCII soubory, (extern�)

emm386                                              pame(t(ov� mana�er, (extern�)

erase                                                   viz del

exit                                                      opu�te(n� COMMAND.COM, DOS okna

expand                                               dekomprimace komprimovan�ch souboru*, (extern�)

fc                                                         porovn�n� dvou souboru*, (extern�)

fdisk                                                   zme(ny/zobrazen� rozde(len� oblast� disku*, (extern�)

find                                                     vyhled�v�n�, (extern�)

for                                                       opakovan� spou�te(n� pr(�kazu*

format                                                 form�tov�n� disku* a disket, (extern�)

keyb                                                   nastavov�n� kl�vesnice, (extern�)

label                                                    nastaven� jmenovky disku, (extern�)

lh                                                         viz loadhigh

loadfix                                                program bude zaveden na prvn�ch 64K pame(ti, (extern�)

loadhigh                                            program je zaveden do horn� pame(ti

md                                                       vytv�r(en� adres�r(u*

mem                                                    zobrazen� mno�stv� pame(ti, (extern�)

mkdir                                                  viz md

mode                                                  konfigurace zar(�zen�, (extern�)

more                                                   postupn� zobrazov�n� v�stupu

move                                                  pr(esuny souboru*, (extern�)

nlsfunc                                               zaveden� podpory n�rodn�ch jazyku*
, (extern�)

path                                                    urc(en�/zobrazen� vyhled�vac� cesty

prompt                                               vzhled pr(�kazov� r(�dky

rd                                                        zru�en� adres�r(e

ren                                                      pr(ejmenov�n�

rename                                               viz ren

rmdir                                                   viz rd

scandisk                                            kontrola a oprava disku*, (extern�)

set                                                       nastaven� syst�mov�ch prome(nn�ch

setver                                                 pr�ce s tabulkou verz�, (extern�)

smartdrv                                            diskov� vyrovn�vac� pame(t(, (extern�)

sort                                                     tr(�de(n�, (extern�)

start                                                    spou�te(n� programu*, (extern�)

subst                                                  asociace cesty s diskem, (extern�)

sys                                                      vytvor(en� startovac�ho disku, (extern�)

time                                                     zobrazen�/nastaven� syst�mov�ho c(asu

type                                                    zobrazen� obsahu textov�ho souboru

ver                                                      zobrazen� verze operac(n�ho syst�mu

verify                                                  nastaven� ove(r(ov�n� z�pisu* souboru*

vol                                                      zobrazen� jm�na a ser.c(�sla disku

xcopy                                                 kop�rov�n� souboru* a adres�r(u*, (extern�)