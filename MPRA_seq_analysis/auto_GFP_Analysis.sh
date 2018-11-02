#auto analysis for ePCR or minOligo clonings
# usage:: auto_GFP_Analysis Barcodes.p NAME read1s

#Barcodes is a dictionary of form::
#Elements is a dictionary of form::
#ElementMatchDict is a dictionary of form:: 


Barcodes=$1
name=$2
shift 2
read1s=$@

echo $name
echo $read1s

#Set Barcode Size 
barcodeSize=10

#submit countfile script 
sbatch -J fasCount -p general -t 1800 --mem=10000 -o $name"countFile.out" -e $name"countFile.err" \
--wrap="~/bin/makeCountFiles_barcodeCount_GFP $Barcodes $name $barcodeSize $read1s"
