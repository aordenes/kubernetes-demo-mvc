using Microsoft.EntityFrameworkCore;

namespace MVCprototipo.Models
{
    public class ContextoCursos : DbContext
    {
        //la cadena de conexion no es instanciada, la cual ya viene instanciada desde el startup
        public ContextoCursos(DbContextOptions<ContextoCursos> options): base(options){} 

        public DbSet<Instructor> Instructor{get; set;} 
        
    }
}