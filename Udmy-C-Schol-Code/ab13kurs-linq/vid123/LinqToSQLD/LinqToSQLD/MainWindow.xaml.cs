using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Configuration;


namespace LinqToSQLD
{
    /// <summary>
    /// Interaktionslogik für MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        LinqToSqlDataClassesDataContext dataContext;


        public MainWindow()
        {
            InitializeComponent();

            string connectionString = ConfigurationManager.ConnectionStrings["LinqToSQLD.Properties.Settings.PanjutorialsDB1ConnectionString"].ConnectionString;
            dataContext = new LinqToSqlDataClassesDataContext(connectionString);
            //InsertUniversities();
            //InsertStudent(); 
            //InsertLectures();
            // InsertStudentLectureAssociations();
            //GetUniversityOfToni();
            //GetLecturesFromToni();
            //GetAllLecturesFromBeijingTech();
            //UpdateToni();
            DeleteJames();
        }

        public void InsertUniversities()
        {
            dataContext.ExecuteCommand("delete from University");

            University yale = new University();
            yale.Name = "Yale";
            dataContext.University.InsertOnSubmit(yale);

            University beijingTech = new University();
            beijingTech.Name = "Beijing Tech";
            dataContext.University.InsertOnSubmit(beijingTech);

            dataContext.SubmitChanges();

            MainDataGrid.ItemsSource = dataContext.University;
        }

        public void InsertStudent()
        {
            University yale = dataContext.University.First(un => un.Name.Equals("Yale"));
            University beijingTech = dataContext.University.First(un => un.Name.Equals("Beijing Tech"));

            List<Student> students = new List<Student>();

            students.Add(new Student { Name = "Carla", Gender = "female", UniversityId = yale.Id });
            students.Add(new Student { Name = "Toni", Gender = "male", UniversityId = yale.Id });
            students.Add(new Student { Name = "Leyle", Gender = "female", UniversityId = beijingTech.Id });
            students.Add(new Student { Name = "James", Gender = "male", UniversityId = beijingTech.Id });

            dataContext.Student.InsertAllOnSubmit(students);
            dataContext.SubmitChanges();

            MainDataGrid.ItemsSource = dataContext.Student;
        }

        public void InsertLectures()
        {
            dataContext.Lecture.InsertOnSubmit(new Lecture { Name = "Math" });
            dataContext.Lecture.InsertOnSubmit(new Lecture { Name = "History" });

            dataContext.SubmitChanges();

            MainDataGrid.ItemsSource = dataContext.Lecture;

        }

        public void InsertStudentLectureAssociations()
        {
            Student carla = dataContext.Student.First(st => st.Name.Equals("Carla"));
            Student toni = dataContext.Student.First(st => st.Name.Equals("Toni"));
            Student leyle = dataContext.Student.First(st => st.Name.Equals("Leyle"));
            Student james = dataContext.Student.First(st => st.Name.Equals("James"));

            Lecture math = dataContext.Lecture.First(lc => lc.Name.Equals("Math"));
            Lecture history = dataContext.Lecture.First(lc => lc.Name.Equals("History"));

            dataContext.StudentLecture.InsertOnSubmit(new StudentLecture { Student = carla, Lecture = math });
            dataContext.StudentLecture.InsertOnSubmit(new StudentLecture { Student = toni, Lecture = math });

            StudentLecture slToni = new StudentLecture();
            slToni.StudentId = toni.Id;
            slToni.LectureId = history.Id;
            dataContext.StudentLecture.InsertOnSubmit(slToni);

            dataContext.StudentLecture.InsertOnSubmit(new StudentLecture { Student = leyle, Lecture = history });
            dataContext.SubmitChanges();

            MainDataGrid.ItemsSource = dataContext.StudentLecture;
        }

        public void GetUniversityOfToni()
        {
            Student toni = dataContext.Student.First(st => st.Name.Equals("Toni"));

            University tonisUniversity = toni.University;
            List<University> universities = new List<University>();
            universities.Add(tonisUniversity);

            MainDataGrid.ItemsSource = universities;
        }

        public void GetLecturesFromToni()
        {
            Student toni = dataContext.Student.First(st => st.Name.Equals("Toni"));
            var tonisLectures = from sl in toni.StudentLecture select sl.Lecture;
            MainDataGrid.ItemsSource = tonisLectures;
        }

        public void GetAllLecturesFromBeijingTech()
        {
            var lecturesFromBeijingTech = from sl in dataContext.StudentLecture
                                          join student in dataContext.Student on sl.StudentId equals student.Id
                                          where student.University.Name == "Beijing Tech"
                                          select sl.Lecture;
            MainDataGrid.ItemsSource = lecturesFromBeijingTech;
        }

        public void UpdateToni()
        {
            Student toni = dataContext.Student.FirstOrDefault(st => st.Name == "Toni");
            toni.Name = "Antonio";
            dataContext.SubmitChanges();
            MainDataGrid.ItemsSource = dataContext.Student;
        }

        public void DeleteJames()
        {
            Student james = dataContext.Student.FirstOrDefault(st => st.Name == "James");
            dataContext.Student.DeleteOnSubmit(james);
            dataContext.SubmitChanges();

            MainDataGrid.ItemsSource = dataContext.Student;
        }


    }
}
