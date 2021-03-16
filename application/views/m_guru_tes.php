<div class="row col-md-12 ini_bodi">
  <div class="panel panel-info">
    <div class="panel-heading">Daftar Ujian / Tes
      <div class="tombol-kanan">
        <a class="btn btn-success btn-sm tombol-kanan" href="#" onclick="return m_ujian_e(0);"><i class="glyphicon glyphicon-plus"></i> &nbsp;&nbsp;Tambah</a>
        <!-- <a class="btn btn-success btn-sm tombol-kanan" href="<?php echo base_url(); ?>adm/m_ujian/edit/0"><i class="glyphicon glyphicon-plus"></i> &nbsp;&nbsp;Tambah</a> -->
      </div>
    </div>
    <div class="panel-body">
        <?php echo $this->session->flashdata('k'); ?>


      <table class="table table-bordered" id="datatabel">
        <thead>
          <tr>
            <th width="5%">No</th>
            <th width="20%">Nama Tes</th>
            <th width="15%">Jumlah Soal</th>
            <th width="15%">Waktu</th>
            <th width="15%">Pengacakan Soal</th>
            <th width="15%">Aksi</th>
          </tr>
        </thead>

        <tbody></tbody>
      </table>
    
      </div>
    </div>
  </div>
</div>
                    




<div class="modal fade" id="m_ujian" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 id="myModalLabel">Buat Ujian</h4>
      </div>
      <div class="modal-body">
        <div class="alert alert-info">
        <a href="#" onclick="return view_petunjuk('petunjuk');">petunjuk ..?</a>
        <div id="petunjuk">
          <ul>
            <li><b>Jml Mapel</b>, harap dimasukkan sesuai jumlah mapel yang yang akan dikerjakan dalam sekali ujian</li>
          </ul>
        </div>
      </div>

          <form name="f_ujian" id="f_ujian" method="get" action="<?php echo base_url("adm/m_ujian/edit/0") ?>">
              <table class="table table-form">
                <tr><td style="width: 25%">Jumlah Mapel</td><td style="width: 75%"><input type="number" class="form-control" name="jml_mapel" id="jml_mapel" required></td></tr>
                
              </table>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary"><i class="fa fa-check"></i> Simpan</button>
        <button class="btn" data-dismiss="modal" aria-hidden="true"><i class="fa fa-minus-circle"></i> Tutup</button>
      </div>
        </form>
    </div>
  </div>
</div>
