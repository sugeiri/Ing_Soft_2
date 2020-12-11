using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace IS2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            int ii_m = 0;
            double ii_a = double.Parse(textBox1.Text.ToString().Trim());
            //int ii_m = int.Parse(textBox2.Text.ToString().Trim());
            double ii_GoS = double.Parse(textBox2.Text.ToString().Trim());
            double InvB = 0;
            InvB = 1.0;
            for(int j=1; j<300; j++)
            {
                InvB = 1.0 + j / ii_a * InvB;
                if(InvB== ii_GoS)
                {
                    Circuitos.Text = j.ToString();
                    break;
                }
            }

            //double ErlangB = 1.0 / InvB;
        }
    }
}
