set outPath to "/tmp"
set tesseractCmd to (do shell script "bash -l -c 'which tesseract'")
do shell script "screencapture -i " & outPath & "/untitled.png"
do shell script tesseractCmd & " " & outPath & "/untitled.png " & outPath & "/output -l jpn"
set the_text to (do shell script "cat " & outPath & "/output.txt")
set the clipboard to the_text
do shell script "rm " & outPath & "/untitled.png " & outPath & "/output.txt"