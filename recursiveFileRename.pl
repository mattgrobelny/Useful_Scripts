use warnings;
use Getopt::Long;

if (($AVRG[1] eq "-h")||($AVRG[1] eq "--help")){
  print(
  " File Renaming Script\n\n
  This script will renames all files in a directory, starting from first to last, to:\n
  filename + [range of value (filemin to filemax)] + file_extension \n
  \n

  All parameters and defaults are:\n
  Defaults= []\n\n

  filename= [No default require]-- Name of file\n
  filemin='0' -- Lowest file number\n
  filemax= [total number of files] -- Highest file number (ie to the last file)\n
  file_ext= [optional no default]\n
  verbose= [FAlSE] -- print each file rename operation \n
  \n
  Example usage:\n
  perl recursiveFileRename.pl -filename Sequence -file_ext .xb.seq -v TRUE \n
  "
  );
  die;
};

# Get current directory
my $current_dir= `pwd`;

#collect file names in directory
my @filenames_in_dir = `ls`;

print(@filenames_in_dir);
#some init variables
my $filename='';
my $filemin='0';
my $filemax=scalar(@filenames_in_dir);
my $file_ext='';
my $verbose='FAlSE';


#Get options
  GetOptions(
  'filename=s' => \$filename,
  'filemin:i' => \$filemin,
  'filemax:i'=> \$filemax,
  '$file_ext:s'=> \$file_ext,
  'v:s'=> \$verbose
);


# for ($filemin_start = $filemin ;  $filemin_start <= $filemax; $filemin_start=$filemin_start++) {
#   my $it_filename= $filename . $additional_text . $filemin_start;
#   if ($verbose eq "TRUE") {
#     print("Now renaming $filenames_in_dir[$filemin_start] to $it_filename");
#     system("rename $it_filename * $filenames_in_dir[$filemin_start]" );
#   }
#   system("rename $it_filename * $filenames_in_dir[$filemin_start]" );
# }
