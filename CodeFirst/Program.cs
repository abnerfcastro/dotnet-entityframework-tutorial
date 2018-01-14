using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace CodeFirst
{
    public class Course
    {
        public Course()
        {
            Tags = new List<Tag>();
        }

        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public Category Category { get; set; }
        public CourseLevel Level { get; set; }
        public float FullPrice { get; set; }
        public Author Author { get; set; }
        public IList<Tag> Tags { get; set; }
    }

    public class Author
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public IList<Course> Courses { get; set; }
    }

    public class Tag
    {
        public Tag()
        {
            Courses = new List<Course>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public IList<Course> Courses { get; set; }
    }

    public enum CourseLevel
    {
        Beginner = 1,
        Intermediate = 2,
        Advanced = 3
    }

    public class Category
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public class PlutoContext : DbContext
    {
        public DbSet<Course> Courses { get; set; }
        public DbSet<Author> Authors { get; set; }
        public DbSet<Tag> Tags { get; set; }
        public DbSet<Category> Categories { get; set; }

        public PlutoContext()
            : base("name=DefaultConnection")
        {           
        }
    }

    public class Program
    {
        public static void Main(string[] args)
        {
            var db = new PlutoContext();
            
            // Get all courses taught by 
            db.Courses
                .Where(c => c.Author.Name == "Karen Hawkins")
                .Select(c => c.Title)
                .ToList()
                .ForEach(Console.WriteLine);                       

            Console.ReadKey();
        }
    }
}
