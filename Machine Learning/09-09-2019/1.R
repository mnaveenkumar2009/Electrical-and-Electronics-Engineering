student_name = c('jora','naveen', 'majnu','manju','laila')
age = c(23,21,20,20,18)
gender = factor(c('M','M','M','M','F'))
# print(gender)
height = c(150,152,149,155,140) # in cm
BG = factor(c('O+','O-','AB+','A+','B+'))
# print(BG)


student_data <- data.frame(
    student_name = student_name,
    age = age,
    gender = gender,
    height = height,
    blood_group = BG,
    stringsAsFactors = FALSE
)
write.csv(student_data, file= "std.csv")
save(student_data, file= "std2.csv")