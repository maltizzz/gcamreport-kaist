setwd("C:/Users/pjhan/Desktop/git/iam_models/GCAM/gcamreport")

devtools::load_all(".", reset = TRUE)

folder_name <<- "gcam-v8.2-Windows-Release-Package"
db_path <<- paste("C:/Users/pjhan/Desktop/GCAM/", folder_name, "/output", sep = "")
db_name <<- "database_basexdb"
GCAM_version <<- "v8.2"
prj_name_ <<- "gcam_v8.2_report.dat"

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
launch_gcamreport_ui(data_path = paste(db_path,"/",prj_name_, sep = "")
                     , GCAM_version = GCAM_version)
