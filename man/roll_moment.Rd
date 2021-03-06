% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/HighFreq.R
\name{roll_moment}
\alias{roll_moment}
\title{Calculate a vector of statistics over an \emph{OHLC} time series, and
calculate a rolling mean over the statistics.}
\usage{
roll_moment(oh_lc, mo_ment = "run_variance", win_dow = 11,
  weight_ed = TRUE, ...)
}
\arguments{
\item{oh_lc}{\emph{OHLC} time series of prices and trading volumes, in
\emph{xts} format.}

\item{mo_ment}{\emph{character} string representing a function for
estimating statistics of a single bar of \emph{OHLC} data, such as
volatility, skew, and higher moments.}

\item{win_dow}{the size of the lookback window, equal to the number of bars
of data used for calculating the rolling mean.}

\item{weight_ed}{\emph{Boolean} argument: should statistic be weighted by
trade volume? (default \code{TRUE})}

\item{...}{additional parameters to the mo_ment function.}
}
\value{
An \emph{xts} time series with a single column and the same number of
  rows as the argument \code{oh_lc}.
}
\description{
Calculate a vector of statistics over an \emph{OHLC} time series, and
calculate a rolling mean over the statistics.
}
\details{
The function \code{roll_moment()} calculates a vector of statistics
  over an \emph{OHLC} time series, such as volatility, skew, and higher
  moments.  The statistics could also be any other aggregation of a single
  bar of \emph{OHLC} data, for example the \emph{High} price minus the
  \emph{Low} price squared.  The length of the vector of statistics is equal
  to the number of rows of the argument \code{oh_lc}. Then it calculates a
  trade volume weighted rolling mean over the vector of statistics over and
  calculate statistics.
}
\examples{
# calculate time series of rolling variance and skew estimates
var_rolling <- roll_moment(oh_lc=SPY, win_dow=21)
skew_rolling <- roll_moment(oh_lc=SPY, mo_ment="run_skew", win_dow=21)
skew_rolling <- skew_rolling/(var_rolling)^(1.5)
skew_rolling[1, ] <- 0
skew_rolling <- rutils::na_locf(skew_rolling)
}

