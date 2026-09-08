setwd("C:/Users/pjhan/Desktop/git/iam_models/GCAM/gcamreport")
devtools::load_all(".", reset = TRUE)

version_ <<- "9.1"

folder_name <<- paste("gcam-v", version_, "-Windows-Release-Package", sep = "")
db_path <<- paste("C:/Users/pjhan/Desktop/GCAM/", folder_name, "/output", sep = "")
db_name <<- "database_basexdb"
GCAM_version <<- "v8.2"
prj_name_ <<- paste("gcam_v", version_, "_report.dat", sep="")

## generate report

generate_report(
    db_path = db_path,
    db_name = db_name,
    prj_name = prj_name_, # creating new if doesn't exist
    scenarios = NULL,       # NULL = use all scenarios
    final_year = 2050,
    launch_ui = TRUE,
    save_output = TRUE
)

## -- launch the user interface
Rdata_path_ <- paste("/gcam_v", version_, "_report_standardized.RData", sep="")
output_name <- paste(db_path, Rdata_path_, sep = "")

##print(output_name)

launch_gcamreport_ui(data_path = output_name, GCAM_version = GCAM_version)
