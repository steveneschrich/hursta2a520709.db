all: hursta2a520709.sqlite

clean:
	@echo Cleaning old R package files...
	rm -rf ../R ../inst ../man ../tests ../DESCRIPTION ../NAMESPACE hursta2a520709.sqlite
	
hursta2a520709.sqlite:
	R CMD BATCH setup_package.R
	mv hursta2a520709.db/* ..
	rmdir hursta2a520709.db
	rm hursta2a520709.sqlite
	
