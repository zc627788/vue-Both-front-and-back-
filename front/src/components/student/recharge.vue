<template>
  <div class="section">
    <div class="form">
      <el-form
        :model="PassForm"
        status-icon
        ref="PassForm"
        :rules="rule"
        label-width="0"
        class="pass-form"
      >
        <h3>充值中心</h3>
        <el-form-item prop="money">
          <el-input v-model="PassForm.money" placeholder="请输入充值金额">
          </el-input>
        </el-form-item>
        <div  class="qr" v-if="qrcodeData">
          <img :src="qrcodeData" />
        </div>

        <el-form-item class="layout-center">
          <el-button
            type="primary"
            class="submitBtn"
            round
            @click="generateQRCode"
          >
            生成二维码
          </el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import qrcode from "qrcode-generator";
export default {
  data() {
    var validatePass = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入金额"));
      } else if (!/^[0-9]+$/.test(value)) {
        callback(new Error("请输入正确金额"));
      } else {
        if (this.PassForm.checkPass !== "") {
          this.$refs.PassForm.validateField("checkPass");
        }
        callback();
      }
    };

    return {
      PassForm: {
        money: ""
      },
      rule: {
        money: [
          {
            validator: validatePass,
            trigger: "blur"
          }
        ]
      },
      qrcodeData: ""
    };
  },

  methods: {
    generateQRCode() {
      if (this.PassForm.money !== "" && /^[0-9]+$/.test(this.PassForm.money)) {
        const typeNumber = 4;
        const errorCorrectionLevel = "L";
        const qr = qrcode(typeNumber, errorCorrectionLevel);
        const baiduUrl = "http://192.168.10.106:8080";
        qr.addData(
          `${baiduUrl}/?#/pay?money=${
            this.PassForm.money
          }&username=${sessionStorage.getItem("username")}`
        );
        qr.make();
        this.qrcodeData = qr.createDataURL();
      }
    }
  }
};
</script>

<style scoped>
.section {
  position: absolute;
  width: 400px;
  margin: 80px auto;
}
.qr{
  text-align: center;
  
}
.qr img{
  width: 100px;
  height: 100px;
}
.pass-form {
  margin: -120px 270px;
  width: 400px;
  height: 380px;
  background: #fff;
  box-shadow: 0 0 10px #b4bccc;
  padding: 40px 30px 0 30px;
  border-radius: 25px;
}
.submitBtn {
  margin-top: 8px;
  width: 47%;
  text-align: center;
}
.resetBtn {
  width: 47%;
}
.form {
  margin-top: 10%;
}
.code {
  height: 40px;
}
.to {
  color: #67c23a;
  cursor: pointer;
}
h3 {
  margin-top: 4px;
  text-align: center;
}
.layout-center {
  text-align: center;
}
</style>
