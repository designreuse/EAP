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
@Table(name="physiological_data")
public class Physiological_data {

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
	//生理指标分类
	private String physiological_classification;
	//血量.血液循环中的血液总量(ml)
	private String blood_volume;
	//血浆量.血液中除去血细胞、血小板的液体成分(ml)
	private String plasma_volume;
	//红细胞计数.每微升血中含百万个红细胞数（禽类○）(×106/μL)
	private String rbc;
	//红细胞体积.红细胞的平均体积（禽类○）(fL)
	private String mcv;
	//红细胞平均厚度.红细胞的平均厚度(μm)
	private String mct;
	//红细胞分布宽度.红细胞体积变异的参数，以测得的红细胞体积大小的变异系数表示(%CV)
	private String rdw;
	//红细胞血红蛋白.每升血中血红蛋白含量(g/L)
	private String hb;
	//红细胞压积.每100毫升血液中压紧的红细胞体积(%)
	private String hct;
	//红细胞血红蛋白含量.平均红细胞血红蛋白含量(pG)
	private String mch;
	//红细胞血红蛋白浓度.平均红细胞血红蛋白浓度(g/L)
	private String mchc;
	//白细胞计数.每微升血中含白细胞总数(×103/μL)
	private String wbc;
	//白细胞嗜中性白细胞.嗜中性白细胞在白细胞总数中的百分数(%)
	private String w_ne;
	//白细胞嗜酸性白细胞.嗜酸性白细胞在白细胞总数中的百分数(%)
	private String eo;
	//白细胞嗜硷性白细胞.嗜硷性白细胞在白细胞总数中的百分数(%)
	private String ba;
	//白细胞淋巴细胞.淋巴细胞在白细胞总数中的百分数(%)
	private String ly;
	//白细胞单核细胞.单核细胞在白细胞总数中的百分数(%)
	private String mo;
	//血小板计数.每微升血中含千个血小板数(×103/μL)
	private String plt;
	//血小板平均容积.单个血小板的平均容积(fL)
	private String mpv;
	//血小板分布宽度.血液内血小板容积变异的参数，以测得的血小板体积大小的变异系数表示(%)
	private String pdw;
	//性成熟.初次发情.受控环境下性发育成熟日龄，雌性动物第一次出现发情征候的年龄，以天计算(d)
	private String first_estrus;
	//性成熟发情期.受控环境下性发育成熟日龄，雌性动物出现发情征候的持续时间，以小时计算(h)
	private String estrus;
	//性成熟发情周期.受控环境下性发育成熟日龄，前后两次发情期之间的间隔时间，以天计算(d)
	private String estrus_period;
	//发情季节.在一年内，动物发情交配集中的时间，列出月份范围
	private String estrus_season;
	//体成熟.动物体发育成熟日龄，以天计算(d)
	private String body_maturation;
	//妊娠期.动物从受孕到分娩的阶段，以天计算(d)
	private String gestation_period;
	//哺乳期.动物从分娩到断奶的阶段，以天计算(d)
	private String suckling_period;
	//生产指数.7.35
	private String production_index;
	//精子计数.每毫升精液所含精子数(×106/mL)
	private String sperm_concentration;
	//精子存活时间.精子的最长存活时间(h)
	private String sperm_survival_time;
	//卵子大小.单个成熟卵子的体积
	private String ovum_size;
	//卵子数量.成熟雌性动物在自然状态下，每次发情期内排出的卵子数
	private String ovum_number;
	//卵子排卵时间.雌性动物在发情期/发情周期开始至出现排卵的时间(h)
	private String ovulation_period;
	//卵子受精能力.成熟卵子排出后至其受孕能力丧失的平均时间(h)
	private String fertilization_ability;
	//产蛋性能开产日龄○.SPF鸡开始产蛋时的日龄(d)
	private String lay_eggs_age;
	//产蛋性能开产体重○.SPF鸡开始产蛋时的体重(kg)
	private String lay_eggs_weight;
	//蛋的品质蛋重.SPF鸡产蛋初期、盛产期、产蛋末期时蛋的重量(g)
	private String egg_weight;
	//蛋的品质蛋壳厚度.SPF鸡产蛋初期、盛产期、产蛋末期时蛋壳的厚度(nm)
	private String shell_thickness;
	//蛋的品质蛋型指数.SPF鸡产蛋初期、盛产期、产蛋末期时的蛋型指数
	private String egg_type_index;
	//蛋的品质哈氏单位.SPF鸡产蛋初期、盛产期、产蛋末期时的哈氏单位
	private String haugh_unit;
	//蛋的品质蛋相对密度.SPF鸡产蛋初期、盛产期、产蛋末期时的蛋相对密度(级)
	private String egg_relative_density;
	//蛋的品质蛋黄比色级别.SPF鸡产蛋初期、盛产期、产蛋末期时的蛋黄比色级别
	private String egg_yolk_ratio;
	//蛋的品质受精率.SPF鸡产蛋初期、盛产期、产蛋末期时的受精率(%)
	private String fertilization_rate;
	//蛋的品质受精蛋孵化率.SPF鸡产蛋初期、盛产期、产蛋末期时的受精蛋的孵化率(%)
	private String hatchability_of_fertile_eggs;
	//蛋的品质蛋壳颜色.所产鸡蛋蛋壳的颜色，分白色、褐色、青色、绿色等
	private String shell_color;
	//蛋的品质孵化期.受精蛋从孵化开始到小鸡出壳的时间(d)
	private String brood_stage;
	//初生体重..幼体初生后的体重(g)
	private String birth_weight;
	//断奶体重..幼体哺乳期结束时的体重(g)
	private String weaning_weight;
	//成年体重..动物成年期的体重(g)
	private String adult_weight;
	//生长曲线..根据动物各生长期的体重数据描出的曲线
	private String growth_curve_url;
	//呼吸频率..动物处于安静状态下的每分钟呼吸次数(次/m)
	private String breathing_rate;
	//体温..动物处于安静状态下的体温(℃)
	private String temperature;
	//消化生理参数..
	private String digestive_index;
	//免疫球蛋白.IgG●.单位体积IgG含量(mg/dl)
	private String igg;
	//免疫球蛋白.IgM●.单位体积IgM含量(mg/dl)
	private String igm;
	//免疫球蛋白.IgD.单位体积IgD含量(mg/dl)
	private String igd;
	//免疫球蛋白.IgA.单位体积IgA含量(mg/dl)
	private String iga;
	//免疫球蛋白.IgE.单位体积IgE含量(mg/dl)
	private String ige;
	//免疫活性细胞表型.T细胞.细胞表面抗原型
	private String t_cell;
	//免疫活性细胞表型.B细胞.细胞表面抗原型
	private String b_cell;
	//血压.收缩压.动物在安静状态时测定的心脏收缩血压(mmHg)
	private String systolic_pressure;
	//血压.舒张压.动物在安静状态时测定的心脏舒张血压(mmHg)
	private String diastolic_pressure;
	//心率.心率.动物在安静状态时每分钟心脏跳动的次数（犬、猴●）(次/m)
	private String heart_rate;
	//心电图.心电图.在体表一定部位记录到的心动周期中的电位变化曲线（包括P、P-Q、QRS、Q-T、T的均值范围）JPG文件（犬、猴●）
	private String electrocardiogram_url;
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
	public String getPhysiological_classification() {
		return physiological_classification;
	}
	public void setPhysiological_classification(String physiological_classification) {
		this.physiological_classification = physiological_classification;
	}
	public String getBlood_volume() {
		return blood_volume;
	}
	public void setBlood_volume(String blood_volume) {
		this.blood_volume = blood_volume;
	}
	public String getPlasma_volume() {
		return plasma_volume;
	}
	public void setPlasma_volume(String plasma_volume) {
		this.plasma_volume = plasma_volume;
	}
	public String getRbc() {
		return rbc;
	}
	public void setRbc(String rbc) {
		this.rbc = rbc;
	}
	public String getMcv() {
		return mcv;
	}
	public void setMcv(String mcv) {
		this.mcv = mcv;
	}
	public String getMct() {
		return mct;
	}
	public void setMct(String mct) {
		this.mct = mct;
	}
	public String getRdw() {
		return rdw;
	}
	public void setRdw(String rdw) {
		this.rdw = rdw;
	}
	public String getHb() {
		return hb;
	}
	public void setHb(String hb) {
		this.hb = hb;
	}
	public String getHct() {
		return hct;
	}
	public void setHct(String hct) {
		this.hct = hct;
	}
	public String getMch() {
		return mch;
	}
	public void setMch(String mch) {
		this.mch = mch;
	}
	public String getMchc() {
		return mchc;
	}
	public void setMchc(String mchc) {
		this.mchc = mchc;
	}
	public String getWbc() {
		return wbc;
	}
	public void setWbc(String wbc) {
		this.wbc = wbc;
	}
	public String getW_ne() {
		return w_ne;
	}
	public void setW_ne(String w_ne) {
		this.w_ne = w_ne;
	}
	public String getEo() {
		return eo;
	}
	public void setEo(String eo) {
		this.eo = eo;
	}
	public String getBa() {
		return ba;
	}
	public void setBa(String ba) {
		this.ba = ba;
	}
	public String getLy() {
		return ly;
	}
	public void setLy(String ly) {
		this.ly = ly;
	}
	public String getMo() {
		return mo;
	}
	public void setMo(String mo) {
		this.mo = mo;
	}
	public String getPlt() {
		return plt;
	}
	public void setPlt(String plt) {
		this.plt = plt;
	}
	public String getMpv() {
		return mpv;
	}
	public void setMpv(String mpv) {
		this.mpv = mpv;
	}
	public String getPdw() {
		return pdw;
	}
	public void setPdw(String pdw) {
		this.pdw = pdw;
	}
	public String getFirst_estrus() {
		return first_estrus;
	}
	public void setFirst_estrus(String first_estrus) {
		this.first_estrus = first_estrus;
	}
	public String getEstrus() {
		return estrus;
	}
	public void setEstrus(String estrus) {
		this.estrus = estrus;
	}
	public String getEstrus_period() {
		return estrus_period;
	}
	public void setEstrus_period(String estrus_period) {
		this.estrus_period = estrus_period;
	}
	public String getEstrus_season() {
		return estrus_season;
	}
	public void setEstrus_season(String estrus_season) {
		this.estrus_season = estrus_season;
	}
	public String getBody_maturation() {
		return body_maturation;
	}
	public void setBody_maturation(String body_maturation) {
		this.body_maturation = body_maturation;
	}
	public String getGestation_period() {
		return gestation_period;
	}
	public void setGestation_period(String gestation_period) {
		this.gestation_period = gestation_period;
	}
	public String getSuckling_period() {
		return suckling_period;
	}
	public void setSuckling_period(String suckling_period) {
		this.suckling_period = suckling_period;
	}
	public String getProduction_index() {
		return production_index;
	}
	public void setProduction_index(String production_index) {
		this.production_index = production_index;
	}
	public String getSperm_concentration() {
		return sperm_concentration;
	}
	public void setSperm_concentration(String sperm_concentration) {
		this.sperm_concentration = sperm_concentration;
	}
	public String getSperm_survival_time() {
		return sperm_survival_time;
	}
	public void setSperm_survival_time(String sperm_survival_time) {
		this.sperm_survival_time = sperm_survival_time;
	}
	public String getOvum_size() {
		return ovum_size;
	}
	public void setOvum_size(String ovum_size) {
		this.ovum_size = ovum_size;
	}
	public String getOvum_number() {
		return ovum_number;
	}
	public void setOvum_number(String ovum_number) {
		this.ovum_number = ovum_number;
	}
	public String getOvulation_period() {
		return ovulation_period;
	}
	public void setOvulation_period(String ovulation_period) {
		this.ovulation_period = ovulation_period;
	}
	public String getFertilization_ability() {
		return fertilization_ability;
	}
	public void setFertilization_ability(String fertilization_ability) {
		this.fertilization_ability = fertilization_ability;
	}
	public String getLay_eggs_age() {
		return lay_eggs_age;
	}
	public void setLay_eggs_age(String lay_eggs_age) {
		this.lay_eggs_age = lay_eggs_age;
	}
	public String getLay_eggs_weight() {
		return lay_eggs_weight;
	}
	public void setLay_eggs_weight(String lay_eggs_weight) {
		this.lay_eggs_weight = lay_eggs_weight;
	}
	public String getEgg_weight() {
		return egg_weight;
	}
	public void setEgg_weight(String egg_weight) {
		this.egg_weight = egg_weight;
	}
	public String getShell_thickness() {
		return shell_thickness;
	}
	public void setShell_thickness(String shell_thickness) {
		this.shell_thickness = shell_thickness;
	}
	public String getEgg_type_index() {
		return egg_type_index;
	}
	public void setEgg_type_index(String egg_type_index) {
		this.egg_type_index = egg_type_index;
	}
	public String getHaugh_unit() {
		return haugh_unit;
	}
	public void setHaugh_unit(String haugh_unit) {
		this.haugh_unit = haugh_unit;
	}
	public String getEgg_relative_density() {
		return egg_relative_density;
	}
	public void setEgg_relative_density(String egg_relative_density) {
		this.egg_relative_density = egg_relative_density;
	}
	public String getEgg_yolk_ratio() {
		return egg_yolk_ratio;
	}
	public void setEgg_yolk_ratio(String egg_yolk_ratio) {
		this.egg_yolk_ratio = egg_yolk_ratio;
	}
	public String getFertilization_rate() {
		return fertilization_rate;
	}
	public void setFertilization_rate(String fertilization_rate) {
		this.fertilization_rate = fertilization_rate;
	}
	public String getHatchability_of_fertile_eggs() {
		return hatchability_of_fertile_eggs;
	}
	public void setHatchability_of_fertile_eggs(String hatchability_of_fertile_eggs) {
		this.hatchability_of_fertile_eggs = hatchability_of_fertile_eggs;
	}
	public String getShell_color() {
		return shell_color;
	}
	public void setShell_color(String shell_color) {
		this.shell_color = shell_color;
	}
	public String getBrood_stage() {
		return brood_stage;
	}
	public void setBrood_stage(String brood_stage) {
		this.brood_stage = brood_stage;
	}
	public String getBirth_weight() {
		return birth_weight;
	}
	public void setBirth_weight(String birth_weight) {
		this.birth_weight = birth_weight;
	}
	public String getWeaning_weight() {
		return weaning_weight;
	}
	public void setWeaning_weight(String weaning_weight) {
		this.weaning_weight = weaning_weight;
	}
	public String getAdult_weight() {
		return adult_weight;
	}
	public void setAdult_weight(String adult_weight) {
		this.adult_weight = adult_weight;
	}
	public String getGrowth_curve_url() {
		return growth_curve_url;
	}
	public void setGrowth_curve_url(String growth_curve_url) {
		this.growth_curve_url = growth_curve_url;
	}
	public String getBreathing_rate() {
		return breathing_rate;
	}
	public void setBreathing_rate(String breathing_rate) {
		this.breathing_rate = breathing_rate;
	}
	public String getTemperature() {
		return temperature;
	}
	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}
	public String getDigestive_index() {
		return digestive_index;
	}
	public void setDigestive_index(String digestive_index) {
		this.digestive_index = digestive_index;
	}
	public String getIgg() {
		return igg;
	}
	public void setIgg(String igg) {
		this.igg = igg;
	}
	public String getIgm() {
		return igm;
	}
	public void setIgm(String igm) {
		this.igm = igm;
	}
	public String getIgd() {
		return igd;
	}
	public void setIgd(String igd) {
		this.igd = igd;
	}
	public String getIga() {
		return iga;
	}
	public void setIga(String iga) {
		this.iga = iga;
	}
	public String getIge() {
		return ige;
	}
	public void setIge(String ige) {
		this.ige = ige;
	}
	public String getT_cell() {
		return t_cell;
	}
	public void setT_cell(String t_cell) {
		this.t_cell = t_cell;
	}
	public String getB_cell() {
		return b_cell;
	}
	public void setB_cell(String b_cell) {
		this.b_cell = b_cell;
	}
	public String getSystolic_pressure() {
		return systolic_pressure;
	}
	public void setSystolic_pressure(String systolic_pressure) {
		this.systolic_pressure = systolic_pressure;
	}
	public String getDiastolic_pressure() {
		return diastolic_pressure;
	}
	public void setDiastolic_pressure(String diastolic_pressure) {
		this.diastolic_pressure = diastolic_pressure;
	}
	public String getHeart_rate() {
		return heart_rate;
	}
	public void setHeart_rate(String heart_rate) {
		this.heart_rate = heart_rate;
	}
	public String getElectrocardiogram_url() {
		return electrocardiogram_url;
	}
	public void setElectrocardiogram_url(String electrocardiogram_url) {
		this.electrocardiogram_url = electrocardiogram_url;
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
