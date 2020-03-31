datacache <- new.env(hash=TRUE, parent=emptyenv())

hursta2a520709 <- function() showQCData("hursta2a520709", datacache)
hursta2a520709_dbconn <- function() dbconn(datacache)
hursta2a520709_dbfile <- function() dbfile(datacache)
hursta2a520709_dbschema <- function(file="", show.indices=FALSE) dbschema(datacache, file=file, show.indices=show.indices)
hursta2a520709_dbInfo <- function() dbInfo(datacache)

hursta2a520709ORGANISM <- "Homo sapiens"

.onLoad <- function(libname, pkgname)
{
    ## Connect to the SQLite DB
    dbfile <- system.file("extdata", "hursta2a520709.sqlite", package=pkgname, lib.loc=libname)
    assign("dbfile", dbfile, envir=datacache)
    dbconn <- dbFileConnect(dbfile)
    assign("dbconn", dbconn, envir=datacache)

    ## Create the OrgDb object
    sPkgname <- sub(".db$","",pkgname)
    txdb <- loadDb(system.file("extdata", paste(sPkgname,
      ".sqlite",sep=""), package=pkgname, lib.loc=libname),
                   packageName=pkgname)    
    dbNewname <- AnnotationDbi:::dbObjectName(pkgname,"ChipDb")
    ns <- asNamespace(pkgname)
    assign(dbNewname, txdb, envir=ns)
    namespaceExport(ns, dbNewname)
        
    ## Create the AnnObj instances
    ann_objs <- createAnnObjs.SchemaChoice("HUMANCHIP_DB", "hursta2a520709", "chip hursta2a520709", dbconn, datacache)
    mergeToNamespaceAndExport(ann_objs, pkgname)
    packageStartupMessage(AnnotationDbi:::annoStartupMessages("hursta2a520709.db"))
}

.onUnload <- function(libpath)
{
    dbFileDisconnect(hursta2a520709_dbconn())
}

