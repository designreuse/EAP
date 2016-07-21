package com.journaldev.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="biochemical_data")
public class Biochemical_data {

	//id属性，主键，唯一，自增
	@Id
	@Column(name="id")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String id;
	//品系的id对应strain表的id，是该实验动物所属的品系
	@ManyToOne
    @JoinColumn(name="strain_id")
	private Strain strain_id;
	//测定时的年龄
	private String age;
	//测定性别
	private String sex;
	//测定数量
	private String number;
	//生化指标分类
	private String biochemical_classification;
	//血液pH..动物安静状态时，血液的pH值(pH)
	private String blood_ph;
	//血电解质.Na+.每升血中含的毫摩尔数(mmol/L)
	private String blood_na;
	//血电解质.K+.每升血中含的毫摩尔数(mmol/L)
	private String blood_k;
	//血电解质.Ca++.每升血中含的毫摩尔数(mmol/L)
	private String blood_ca;
	//血电解质.Mg++.每升血中含的毫摩尔数(mmol/L)
	private String blood_mg;
	//血电解质.CL-.每升血中含的毫摩尔数(mmol/L)
	private String blood_cl;
	//血电解质.P+.每升血中含的毫摩尔数(mmol/L)
	private String blood_p;
	//血电解质.Fe2+.每升血中含的毫摩尔数(mmol/L)
	private String blood_fe;
	//总胆红素
	private String total_bilirubin;
	//高密度脂蛋白胆固醇
	private String c_hdl;
	//低密度脂蛋白胆固醇
	private String c_ldl;
	//谷草转氨酶●..每升血中含的酶活力单位数(U/L)
	private String ast;
	//谷丙转氨酶●..每升血中含的酶活力单位数(U/L)
	private String alt;
	//碱性磷酸酶..每升血中含的酶活力单位数(U/L)
	private String alp;
	//乳酸脱氢酶..每升血中含的酶活力单位数(U/L)
	private String ldh;
	//肌苷●..每升血中含的毫摩尔数(mmol/L)
	private String cre;
	//尿素氮●..每升血中含的毫摩尔数(mmol/L)
	private String bun;
	//总胆固醇●..每升血中含的毫摩尔数(mmol/L)
	private String tch;
	//血清总蛋白●..每升血中含的克数(g/L)
	private String tp;
	//白蛋白●..每升血中含的克数(g/L)
	private String alb;
	//甘油三脂●..每升血中含的毫摩尔数(mmol/L)
	private String tg;
	//血糖●..每升血中含的毫摩尔数(mmol/L)
	private String glu;
	//孕酮..分妊娠期（分为：妊娠前、中、后期）；非妊娠期（分为：滤泡期、排卵期和黄体期）(ng/mL)
	private String progesterone;
	//尿液pH..动物安静状态时，尿液的pH值
	private String urine_ph;
	//尿蛋白●..每毫升尿中所含蛋白的纳克数(ng/mL)
	private String up;
	//尿酸..每毫升尿中所含蛋白的纳克数(ng/mL)
	private String ua;
	//尿电解质.Na+.每100毫升尿中含的毫克数(mg/dL)
	private String urine_na;
	//尿电解质.K+.每100毫升尿中含的毫克数(mg/dL)
	private String urine_k;
	//尿电解质.Ca++.每100毫升尿中含的毫克数(mg/dL)
	private String urine_ca;
	//尿电解质.Mg++.每100毫升尿中含的毫克数(mg/dL)
	private String urine_mg;
	//尿电解质.CL-.每100毫升尿中含的毫克数(mg/dL)
	private String urine_cl;
	//比重●..4℃时，尿液与纯水的重量之比
	private String specific_weight;
	//尿量..动物一天的排尿量。以一天内动物每克体重所排出尿的毫升数表示（犬、猴●）(ml/g/天)
	private String upd;
	private String time;
			
	public String getId() 
	{
		return id;
	}
	public void setId(String id) 
	{
		this.id = id;
	}
	
	public Strain getStrain_id() 
	{
		return strain_id;
	}
	public void setStrain_id(Strain strain_id) 
	{
		this.strain_id = strain_id;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getBiochemical_classification() {
		return biochemical_classification;
	}
	public void setBiochemical_classification(String biochemical_classification) {
		this.biochemical_classification = biochemical_classification;
	}
	public String getBlood_ph() {
		return blood_ph;
	}
	public void setBlood_ph(String blood_ph) {
		this.blood_ph = blood_ph;
	}
	public String getBlood_na() {
		return blood_na;
	}
	public void setBlood_na(String blood_na) {
		this.blood_na = blood_na;
	}
	public String getBlood_k() {
		return blood_k;
	}
	public void setBlood_k(String blood_k) {
		this.blood_k = blood_k;
	}
	public String getBlood_ca() {
		return blood_ca;
	}
	public void setBlood_ca(String blood_ca) {
		this.blood_ca = blood_ca;
	}
	public String getBlood_mg() {
		return blood_mg;
	}
	public void setBlood_mg(String blood_mg) {
		this.blood_mg = blood_mg;
	}
	public String getBlood_cl() {
		return blood_cl;
	}
	public void setBlood_cl(String blood_cl) {
		this.blood_cl = blood_cl;
	}
	public String getBlood_p() {
		return blood_p;
	}
	public void setBlood_p(String blood_p) {
		this.blood_p = blood_p;
	}
	public String getC_ldl() {
		return c_ldl;
	}
	public void setC_ldl(String c_ldl) {
		this.c_ldl = c_ldl;
	}
	public String getC_hdl() {
		return c_hdl;
	}
	public void setC_hdl(String c_hdl) {
		this.c_hdl = c_hdl;
	}
	public String getTotal_bilirubin() {
		return total_bilirubin;
	}
	public void setTotal_bilirubin(String total_bilirubin) {
		this.total_bilirubin = total_bilirubin;
	}
	public String getBlood_fe() {
		return blood_fe;
	}
	public void setBlood_fe(String blood_fe) {
		this.blood_fe = blood_fe;
	}
	public String getAst() {
		return ast;
	}
	public void setAst(String ast) {
		this.ast = ast;
	}
	public String getAlt() {
		return alt;
	}
	public void setAlt(String alt) {
		this.alt = alt;
	}
	public String getAlp() {
		return alp;
	}
	public void setAlp(String alp) {
		this.alp = alp;
	}
	public String getLdh() {
		return ldh;
	}
	public void setLdh(String ldh) {
		this.ldh = ldh;
	}
	public String getCre() {
		return cre;
	}
	public void setCre(String cre) {
		this.cre = cre;
	}
	public String getBun() {
		return bun;
	}
	public void setBun(String bun) {
		this.bun = bun;
	}
	public String getTch() {
		return tch;
	}
	public void setTch(String tch) {
		this.tch = tch;
	}
	public String getTp() {
		return tp;
	}
	public void setTp(String tp) {
		this.tp = tp;
	}
	public String getTg() {
		return tg;
	}
	public void setTg(String tg) {
		this.tg = tg;
	}
	public String getAlb() {
		return alb;
	}
	public void setAlb(String alb) {
		this.alb = alb;
	}
	public String getGlu() {
		return glu;
	}
	public void setGlu(String glu) {
		this.glu = glu;
	}
	public String getProgesterone() {
		return progesterone;
	}
	public void setProgesterone(String progesterone) {
		this.progesterone = progesterone;
	}
	public String getUrine_ph() {
		return urine_ph;
	}
	public void setUrine_ph(String urine_ph) {
		this.urine_ph = urine_ph;
	}
	public String getUp() {
		return up;
	}
	public void setUp(String up) {
		this.up = up;
	}
	public String getUa() {
		return ua;
	}
	public void setUa(String ua) {
		this.ua = ua;
	}
	public String getUrine_na() {
		return urine_na;
	}
	public void setUrine_na(String urine_na) {
		this.urine_na = urine_na;
	}
	public String getUrine_k() {
		return urine_k;
	}
	public void setUrine_k(String urine_k) {
		this.urine_k = urine_k;
	}
	public String getUrine_ca() {
		return urine_ca;
	}
	public void setUrine_ca(String urine_ca) {
		this.urine_ca = urine_ca;
	}
	public String getUrine_mg() {
		return urine_mg;
	}
	public void setUrine_mg(String urine_mg) {
		this.urine_mg = urine_mg;
	}
	public String getUrine_cl() {
		return urine_cl;
	}
	public void setUrine_cl(String urine_cl) {
		this.urine_cl = urine_cl;
	}
	public String getSpecific_weight() {
		return specific_weight;
	}
	public void setSpecific_weight(String specific_weight) {
		this.specific_weight = specific_weight;
	}
	public String getUpd() {
		return upd;
	}
	public void setUpd(String upd) {
		this.upd = upd;
	}
	public String getTime() 
	{
		return time;
	}
	public void setTime(String time) 
	{
		this.time = time;
	}
	@Override
	public String toString(){
		return "【id】："+id+", 【发布时间】："+time;
	}
	
	
}
