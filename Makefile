Report.html: Report.Rmd Code/02_render_report.R make_table
	Rscript Code/02_render_report.R

make_table: clean_data
	Rscript Code/01_make_table.R

clean_data:
	Rscript Code/00_clean_data.R

.PHONY: clean
clean:
	rm -f Output/*.rds && rm -f Report.html
