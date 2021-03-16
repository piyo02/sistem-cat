<div class="row col-md-12 ini_bodi">
  <div class="panel panel-info">
    <div class="panel-heading">Tambah Ujian</div>
    <div class="panel-body">
      <form class='form-horizontal' method="post" action="<?php echo base_url('adm/m_ujian/simpan'); ?>" >
          <input type="hidden" name="id" id="id" value="<?php echo $d['id']; ?>">
          <input type="hidden" name="jml_mapel" id="jml_mapel" value="<?php echo $d['jml_mapel']; ?>">
          <input type="hidden" name="mode" id="mode" value="<?php echo $d['mode']; ?>">
          <div id="konfirmasi"></div>
            <div class="form-group fgsoal">
              <div class="col-md-2"><label>Nama Ujian</label></div>
              <div class="col-md-10">
                <input type="text" class="form-control" name="nama_ujian" id="nama_ujian" required value="<?php echo $d['nama_ujian']; ?>">
                </select>
              </div>
            </div>
            <div class="form-group fgsoal">
              <div class="col-md-2"><label>Tgl Mulai</label></div>
              <div class="col-md-10">
                <input type="date" value="<?php echo explode(" ", $d['tgl_mulai'])[0];?>" name='tgl_mulai' class="form-control" style="width: 150px; display: inline; float: left" id="tgl_mulai" placeholder="Tgl" data-tooltip="waktu awal boleh menge-klik tombol \"mulai\" ujian" required>
              </div>
            </div>
            <div class="form-group fgsoal">
              <div class="col-md-2"><label>Tgl Selesai</label></div>
              <div class="col-md-10">
                <input type="date" value="<?php echo explode(" ", $d['terlambat'])[0];?>" name='terlambat' class="form-control" style="width: 150px; display: inline; float: left" id="terlambat" placeholder="Tgl" required>
              </div>
            </div>
            <div class="form-group fgsoal">
              <div class="col-md-2"><label>Acak Soal</label></div>
              <div class="col-md-10">
                <select class="form-control" name="acak" id="acak" required>
                  <?php 
                  foreach ($pola_tes as $pola_id => $pola) {
                    if ($d['jenis'] == $pola_id) {
                      echo '<option value="'.$pola_id.'" selected>'.$pola.'</option>';
                    } else {
                      echo '<option value="'.$pola_id.'">'.$pola.'</option>';
                    }
                  }
                  ?>
                </select>
              </div>
            </div>
            <br>
            <br>

            <?php $i = 0; foreach ($d['arr_mapel'] as $mapel ) { ?>
              <div class="form-group fgsoal">
                <div class="col-md-2"><label>Mata Pelajaran</label></div>
                <div class="col-md-10">
                  <input type="hidden" name="mapel_tes_id_<?php echo $i ?>" id="mapel_tes_id_<?php echo $i ?>" value="<?php echo $mapel['id']; ?>">
                  <select class="form-control" name="mapel_<?php echo $i?>" id="mapel_<?php echo $i?>" required>
                  <?php 
                  foreach ($p_mapel as $mapel_id => $mapel_) {
                    if ($mapel['mapel_id'] == $mapel_id) {
                      echo '<option value="'.$mapel_id.'" selected>'.$mapel_.'</option>';
                    } else {
                      echo '<option value="'.$mapel_id.'">'.$mapel_.'</option>';
                    }
                  }
                  ?><br>
                  </select>
                </div>
              </div>
              <div class="form-group fgsoal">
                <div class="col-md-2"><label>Jumlah soal</label></div>
                <div class="col-md-10">
                  <input type="text" class="form-control" name="jumlah_soal_<?php echo $i; ?>" id="jumlah_soal_<?php echo $i; ?>" required value="<?php echo $mapel['jml_soal']; ?>">
                </div>
              </div>
              <div class="form-group fgsoal">
                <div class="col-md-2"><label>Waktu Ujian</label></div>
                <div class="col-md-10">
                  <input type="text" class="form-control" name="waktu_<?php echo $i; ?>" id="waktu_<?php echo $i; ?>" required value="<?php echo $mapel['waktu']; ?>">
                </div>
              </div>
            <?php $i++; } ?>


            <div class="form-group" style="margin-top: 20px">
              <div class="col-md-12">
                <button type="submit" class="btn btn-info"><i class="fa fa-check"></i> Simpan</button>
                <a href="<?php echo base_url(); ?>adm/m_ujian" class="btn btn-default"><i class="fa fa-minus-circle"></i> Kembali</a>
              </div>
            </div>
      </form>
    </div><!-- panel body-->
  </div>
</div>
</div>
