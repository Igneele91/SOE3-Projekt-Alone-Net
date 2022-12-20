﻿using System;
using System.Xml.Linq;
using System.Linq;

namespace LinqMitXML
{
    class Program
    {
        static void Main(string[] args)
        {
            string studentsXML =
                        @"<Students>
                            <Student>
                                <Name>Toni</Name>
                                <Age>21</Age>
                                <University>Yale</University>
                                <Semester>6</Semester>
                            </Student>
                            <Student>
                                <Name>Carla</Name>
                                <Age>17</Age>
                                <University>Yale</University>
                                <Semester>1</Semester>
                            </Student>
                            <Student>
                                <Name>Leyla</Name>
                                <Age>19</Age>
                                <University>Beijing Tech</University>
                                <Semester>3</Semester>
                            </Student>
                            <Student>
                                <Name>Frank</Name>
                                <Age>25</Age>
                                <University>Beijing Tech</University>
                                <Semester>12</Semester>
                            </Student>
                        </Students>";
            XDocument studentsXdoc = new XDocument();
            studentsXdoc = XDocument.Parse(studentsXML);

            var students = from student in studentsXdoc.Descendants("Student")
                           select new
                           {
                               Name = student.Element("Name").Value,
                               Age = student.Element("Age").Value,
                               University = student.Element("University").Value,
                               Semester = student.Element("Semester").Value
                           };

            foreach (var student in students)
            {
                Console.WriteLine("Student {0} mit dem alter {1} von" +
                    " der Uni {2} ist im {3} Semester.", student.Name, student.Age, student.University, student.Semester);
            }

            var sortedStudents = from student in students
                                 orderby student.Age
                                 select student;
            foreach (var student in sortedStudents)
            {
                Console.WriteLine("Student {0} mit dem alter {1} von" +
                    " der Uni {2} ist im {3} Semester.", student.Name, student.Age, student.University, student.Semester);
            }

            Console.ReadLine();
        }
    }
}
