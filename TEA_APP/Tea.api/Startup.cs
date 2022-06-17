using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Tea.utilities;

namespace Tea.api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }
        private string url_site = Helper.GetUrlSite();

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();

            string semilla = "TeaApp2022";
            byte[] semillarByte = Encoding.UTF8.GetBytes(semilla);
            SymmetricSecurityKey key = new SymmetricSecurityKey(semillarByte);

            services.AddAuthentication
                (JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(option =>
                {
                    option.TokenValidationParameters = new TokenValidationParameters
                    {
                        IssuerSigningKey = key,
                        ValidateLifetime = true,
                        ValidIssuer = "www.tea.com",
                        ValidAudience = "www.tea.com",
                        ValidateIssuer = true
                    };
                });

            services.AddCors(opt =>
            {
                opt.AddPolicy("Todos", det =>
                {
                    det.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader();
                });
                opt.AddPolicy("SoloTea", det =>
                {
                    det.WithOrigins(url_site).WithMethods(new string[] { "Get", "Post", "Put", "Delete" }).AllowAnyHeader();
                });
            });

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Tea App", Version = "1.0" });
                c.ResolveConflictingActions(apiDescriptions => apiDescriptions.First());
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            // swagger
            app.UseSwagger();
            app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "App V1"));

            //app.UseHttpsRedirection();

            app.UseRouting();

            app.UseCors("SoloTea");

            app.UseAuthentication();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
