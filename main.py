from pyspark import SparkContext
from pyspark.sql import SQLContext, SparkSession

sc = SparkContext()
spark = SQLContext(sc)

# spark
print(f"Spark version = {SparkSession.builder.getOrCreate().version}")

# hadoop
print(f"Hadoop version = {sc._jvm.org.apache.hadoop.util.VersionInfo.getVersion()}")

# delta
N_ROWS = 20
spark.range(1, N_ROWS+1).write.format("delta").save("./data")

spark.read.format("delta").load("./data").show()