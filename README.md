# Plagiarism-Checker-using-x86-Assembly-Language


# Introduction:
I have made a text-based plagiarism checker which will examine files and carry out procedures which would check for the similarities in the files and finally print the percentage of matched material this plagiarism checker can check up to three files at a time and is very useful to compare similarities between any files.

# Objective:
To design a plagiarism checker based on MASM.

# Literature Review:

Schools are making use of software systems, in addition to the existing and very effective methods that rely on the marker's knowledge of their subject. Systems such as Turnitin are currently available. You should be assured that academic judgement is always brought into play when analyzing the results. A school will not take action against you for plagiarism as a result of the findings of Turnitin unless it has looked very carefully at the report obtained from the software and assured itself that there are sufficient grounds for concern. You will be able to see the relevant report and to challenge the school’s case if you are accused of plagiarism following a software-based analysis of your work. Above all, the systems of software detection will be used openly and transparently by your school. Systems are not intended as a trap. However, the university reserves the right to protect the academic integrity of its degree awards by whatever means available to it. This will benefit those students who did not plagiarize.

# Problem Definition:

Plagiarism is a form of cheating and is a serious academic offence. It arises where work submitted by a student is not their own and has been taken from another source. The original material is then hidden from the marker, either by not referencing it properly, by paraphrasing it or by not mentioning it at all. 
**The most common forms of plagiarism are:**

1. Copying
2. Self-plagiarism (also called auto-plagiarism)
3. Collusion
4. Fabrication or misrepresentation
5. Commissioning work / buying essays and software

Plagiarism may occur in a number of other forms, as Ill as in conventional written work. Another student may be involved hence our program deals with copying which is one of the most prominent forms of plagiarism.

# Methodology:

The tool used is Microsoft Visual Studio, the architecture used is x86 and Microsoft Micro Assembler is used to assemble the project the technique used is to traverse all the words in form of triplets in a file and match them with other files and the finally calculate the percentage of the copied words.

# Implementation, Testing and Programming code:

**The project can be interpreted to be in three steps.** 
1.Read from all 3 files and store the read bytes in a string.
2.Compare the read bytes from one file to the other two files one by one in form of triplets of words and then increment the count of matched words
3.The percentage is calculated by divided the matched words from the total words.

These steps Ire done using procedures discussed below one by one according to the flow of program:
After declaration of all necessary data in the data segment in the code segment start procedure is called which shows an intro of our project the program proceeds when user presses a key. After those three procedures are called which read data up to 5000 bytes from three respective files and store them in 3 respective strings using file handling.

# Conclusion, Cost and Future Work:
Plagiarism remains an ongoing issue in publishing and in academia. The software programs are available to detect similarities to published content for example previously submitted student papers, thesis, and websites. These software programs can assist writers with identifying instances of ‘unintentional’ plagiarism, and help editors to identify all types of plagiarism. These Software programs can be extremely helpful in detecting and counseling authors about plagiarism. But the software is not enough,
multiple and ongoing strategies are needed, otherwise there will be pervasive cheating and lack of integrity in future generations of scientists and other professionals.

#References:

1.[Brinkman, B. (2013). An analysis of student privacy rights in the use of plagiarism detection systems.
Science and Engineering Ethics, 19(3), 1255– 1266.](https://link.springer.com/article/10.1007/s11948-012-9370-y)
2.[Butler, D. (2010). Journals step up plagiarism policing Nature, 466(7303), 167.](https://www.nature.com/articles/466167a)
3.[Dahl, S. (2007). The student perspective on using plagiarism detection software. Active Learning in
Higher Education, 8(2), 173– 191.](https://journals.sagepub.com/doi/abs/10.1177/1469787407074110)
4.[Garner, H. (2012). Science publishing: How to stop plagiarism. Nature, 481(7379), 21– 23.](https://www.nature.com/articles/481021a)

