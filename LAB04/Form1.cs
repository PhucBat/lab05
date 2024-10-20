using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Lab02_02
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            
            cmbFaculty.Items.Add("Quản Trị Kinh Doanh");
            cmbFaculty.Items.Add("Công Nghệ Thông TIn");
            cmbFaculty.Items.Add("Ngôn Ngữ Anh");

            
            cmbFaculty.SelectedIndex = 0;

        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            
            if (txtStudenID.Text.Length != 10)
            {
                MessageBox.Show("Mã số sinh viên phải có 10 kí tự!");
                return;
            }


            string mssv = txtStudenID.Text;
            string hoTen = txtFullname.Text;
            float diemTB;

           
            if (!float.TryParse(txtAVG.Text, out diemTB))
            {
                MessageBox.Show("Điểm trung bình không hợp lệ!");
                return;
            }

           
            if (cmbFaculty.SelectedIndex == -1)
            {
                MessageBox.Show("Vui lòng chọn chuyên ngành!");
                return;
            }

            string khoa = cmbFaculty.SelectedItem.ToString();

            
            bool sinhVienTonTai = false;
            foreach (DataGridViewRow row in dgvStudent.Rows)
            {
                if (row.Cells[0].Value != null && row.Cells[0].Value.ToString() == mssv)
                {
                    
                    row.Cells[1].Value = hoTen;
                    row.Cells[2].Value = diemTB;
                    row.Cells[3].Value = khoa;
                    sinhVienTonTai = true;
                    break;
                }
            }

           
            if (!sinhVienTonTai)
            {
                dgvStudent.Rows.Add(mssv, hoTen, diemTB, khoa);
            }

           
            txtStudenID.Clear();
            txtFullname.Clear();
            txtAVG.Clear();
            cmbFaculty.SelectedIndex = -1;
        }


        private void btnDelete_Click(object sender, EventArgs e)
        {
            string studentID = txtStudenID.Text.Trim();
            bool studentExists = false;

            
            foreach (DataGridViewRow row in dgvStudent.Rows)
            {
                if (row.Cells["Column1"].Value != null &&
                    row.Cells["Column1"].Value.ToString() == studentID)
                {
                    studentExists = true;
                   
                    DialogResult result = MessageBox.Show("Bạn có chắc chắn muốn xóa sinh viên này?", "Xác nhận", MessageBoxButtons.YesNo);
                    if (result == DialogResult.Yes)
                    {
                        dgvStudent.Rows.RemoveAt(row.Index);
                        MessageBox.Show("Xóa sinh viên thành công!");

                    }
                    break;
                }
            }

            if (!studentExists)
            {
                MessageBox.Show("Không tìm thấy MSSV cần xóa!");
            }
        }

        private void dgvStudent_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dgvStudent.Rows[e.RowIndex];

                
                txtStudenID.Text = row.Cells["Column1"].Value.ToString();
                txtFullname.Text = row.Cells["Column2"].Value.ToString();
                txtAVG.Text = row.Cells["Column4"].Value.ToString();
                cmbFaculty.SelectedItem = row.Cells["Column5"].Value.ToString();
            }
        }


        private void txtStudenID_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void txtFullname_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void txtAVG_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void cmbFaculty_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }


        private void groupBox1_Enter(object sender, EventArgs e)
        {
            
        }

        private void btnexit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {

        }

        private void btnSua_Click(object sender, EventArgs e)
        {

        }
    }
}
