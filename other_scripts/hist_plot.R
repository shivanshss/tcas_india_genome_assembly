# Read the data from the text file
data <- read.table("/home/bloodmark/Chr0_RagTag_contigs_corrected.hist", header = FALSE, sep = "\t", col.names = c("SequenceName", "Length"))

# Apply the log transformation (base 10)
data$LogLength <- log10(data$Length)

mean(data$Length)

median(data$Length)

range(data$Length)


# Create a histogram of log-transformed sequence lengths
hist(data$LogLength, breaks = 20, main = "Log Sequence Length Histogram", xlab = "Log Sequence Length (base 10)", ylab = "Frequency", col = "blue")

# You can adjust the 'breaks' parameter to control the number of bins in the histogram.

# Save the plot as an image file (e.g., PNG)
png("log_sequence_length_histogram.png", width = 800, height = 600)
hist(data$LogLength, breaks = 20, main = "Log Sequence Length Histogram", xlab = "Log Sequence Length (base 10)", ylab = "Frequency", col = "blue")
dev.off()


# Filter the data for sequences with lengths above 30,000
filtered_data <- data[data$Length > 1000, ]

sum(filtered_data$Length)

sum(data$Length)


# Create a histogram of log-transformed sequence lengths for filtered data
hist(filtered_data$LogLength, breaks = 20, main = "Log Sequence Length Histogram (Length > 30,000)", xlab = "Log Sequence Length (base 10)", ylab = "Frequency", col = "blue")

