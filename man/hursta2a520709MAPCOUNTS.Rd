\name{hursta2a520709MAPCOUNTS} 

\alias{hursta2a520709MAPCOUNTS}


\title{Number of mapped keys for the maps in package hursta2a520709.db}

\description{
  DEPRECATED. Counts in the MAPCOUNT table are out of sync and should
  not be used.

  hursta2a520709MAPCOUNTS provides the "map count" (i.e. the
  count of mapped keys) for each map in package hursta2a520709.db.
}

\details{ 
  DEPRECATED. Counts in the MAPCOUNT table are out of sync and should
  not be used.

  This "map count" information is precalculated and stored in the
  package annotation DB. This allows some quality control and is used by
  the \code{\link[AnnotationDbi:AnnDbPkg-checker]{checkMAPCOUNTS}}
  function defined in AnnotationDbi to compare and validate different
  methods (like \code{count.mappedkeys(x)} or
  \code{sum(!is.na(as.list(x)))}) for getting the "map count" of a given
  map.
}

\keyword{datasets}

