<div class="row col-md-12 ini_bodi">
  <div class="panel panel-info">
    <div class="panel-heading">Konfirmasi Data</div>

    <div class="panel-body">
      <input type="hidden" name="id_ujian" id="id_ujian" value="<?php echo $du['id']; ?>">
      <input type="hidden" name="_token" id="_token" value="<?php echo $du['token']; ?>">
      <input type="hidden" name="_tgl_sekarang" id="_tgl_sekarang" value="<?php echo date('Y-m-d H:i:s'); ?>">
      <input type="hidden" name="_tgl_mulai" id="_tgl_mulai" value="<?php echo $tgl_mulai; ?>">
      <input type="hidden" name="_terlambat" id="_terlambat" value="<?php echo $terlambat; ?>">
      <input type="hidden" name="_statuse" id="_statuse" value="<?php echo $du['statuse']; ?>">
      <div class="col-md-7">
        <div class="panel panel-default">
          <div class="panel-body">
            <table class="table table-bordered">
              <tr><td width="35%">Nama</td><td width="65%"><?php echo $dp['nama']; ?></td></tr>
              <tr><td>NIM</td><td><?php echo $dp['nim']; ?></td></tr>
              <tr><td>Guru / Mapel</td><td><?php echo $du['nmguru'];?></td></tr>
              <tr><td>Nama Ujian</td><td><?php echo $du['nama_ujian']; ?></td></tr>
              <tr><td>Jml Soal</td><td><?php echo $du['jml_soal']; ?></td></tr>
              <tr><td>Waktu</td><td><?php echo $du['waktu']; ?> menit</td></tr>
              <tr><td>Token</td><td><input type="text" name="token" id="token" required="true" class="form-control col-md-3" value="JIHYE"></td></tr>
            </table>
          </div>
        </div>
      </div>
      
      <div class="col-md-5">
        <div class="panel panel-default">
          <div class="panel-body">
            <div class="alert alert-info">
              Waktu boleh mengerjakan ujian adalah saat tombol "MULAI" berwarna hijau..!
            </div>

            <div id="btn_mulai">Ujian akan mulai dalam <div id="akan_mulai"></div></div>

            <div class="btn btn-danger" id="waktu_" style="margin-top: 20px">
              Sisa waktu mengikuti ujian <br>
              <span id="waktu_akhir_ujian"></span>
            </div>

            <div id="waktu_game_over"></div>

            <!--
            <a href="#" class="btn btn-success btn-lg" id="tbl_mulai" onclick="return konfirmasi_token(<?php echo $du['id']; ?>)"><i class="fa fa-check-circle"></i> MULAI</a>
            <div class="btn btn-danger" id="ujian_selesai">UJIAN TELAH SELESAI</div>
            -->
          </div>
        </div>
      </div>

    </div>
  </div>
</div>


</div>
