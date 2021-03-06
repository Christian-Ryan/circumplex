% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ssm_visualization.R
\name{ssm_plot_circle}
\alias{ssm_plot_circle}
\title{Create a Circular Plot of SSM Results}
\usage{
ssm_plot_circle(.ssm_object, amax = NULL, fontsize = 12, lowfit = TRUE)
}
\arguments{
\item{.ssm_object}{The output of \code{ssm_profiles()} or
\code{ssm_measures()}.}

\item{amax}{A positive real number corresponding to the radius of the circle.
It is used to scale the amplitude values and will determine which amplitude
labels are drawn.}

\item{fontsize}{A positive real number corresponding to the size (in pt) of
the text labels (default = 12).}

\item{lowfit}{A logical determining whether profiles with low model fit
(<.70) should be plotted, with dashed borders (default = TRUE).}
}
\value{
A ggplot variable containing a completed circular plot.
}
\description{
Take in the results of a Structural Summary Method analysis and plot the
point and interval estimate for each row (e.g., group or measure) in a
circular space quantified by displacement and amplitude.
}
