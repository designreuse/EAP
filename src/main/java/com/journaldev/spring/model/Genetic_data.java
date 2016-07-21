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
@Table(name="genetic_data")
public class Genetic_data {

	//id属性，主键，唯一，自增
	@Id
	@Column(name="id")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String id;
	//品系的id对应strain表的id，是该实验动物所属的品系
	@ManyToOne
    @JoinColumn(name="strain_id")
	private Strain strain_id;

	//细胞遗传标记-染色体数
	private String chromosome_number;
	//细胞遗传标记-染色体标准核型
	private String standard_karyotype_id;
	//细胞遗传标记-染色体C带
	private String chromosome_c_image_id;
	//细胞遗传标记-染色体G带
	private String chromosome_g_image_id;
	//生化基因标记
	private String biochemical_gene_markers;
	//组织相容性基因
	private String histocompatibility_gene;
	//肋骨类型
	private String frame_type;
	//毛色或羽色基因
	private String coat_color_gene;
	//血型基因
	private String blood_group_gene;
	//下颌骨特征
	private String mandibular_characteristics;
	//微卫星DNA
	private String microsatellite;
	//所属分类
	private String animal_classification;
	//转基因动物-命名
	private String tra_name;
	//转基因动物-背景品系
	private String tra_background;
	//转基因动物-插入转基因名称
	private String tra_insert_transgene_name;
	//转基因动物-插入位点
	private String tra_insertion_site;
	//转基因动物-拷贝数
	private String tra_copy_number;
	//转基因动物-异常表型
	private String tra_abnormal_phenotype;
	//转基因动物-参考文献
	private String tra_references;
	//基因定位突变动物-命名
	private String tar_name;
	//基因定位突变动物-背景品系
	private String tar_background;
	//基因定位突变动物-插入基因名
	private String tar_insert_transgene_name;
	//基因定位突变动物-被剔出基因名
	private String tar_eliminating_gene_name;
	//基因定位突变动物-异常表型
	private String tar_abnormal_phenotype;
	//基因定位突变动物-参考文献
	private String tar_references;
	//其他突变动物-命名
	private String oth_name;
	//其他突变动物-背景品系
	private String oth_background;
	//其他突变动物-突变基因
	private String oth_mutant_gene;
	//其他突变动物-突变位点
	private String oth_mutant_site;
	//其他突变动物-异常表型
	private String oth_abnormal_phenotype;
	//其他突变动物-参考文献
	private String oth_references;
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
	public String getChromosome_number() 
	{
		return chromosome_number;
	}
	public void setChromosome_number(String chromosome_number) 
	{
		this.chromosome_number = chromosome_number;
	}
	public String getStandard_karyotype_id() 
	{
		return standard_karyotype_id;
	}
	public void setStandard_karyotype_id(String standard_karyotype_id)
	{
		this.standard_karyotype_id = standard_karyotype_id;
	}
	public String getChromosome_c_image_id()
	{
		return chromosome_c_image_id;
	}
	public void setChromosome_c_image_id(String chromosome_c_image_id)
	{
		this.chromosome_c_image_id = chromosome_c_image_id;
	}
	public String getChromosome_g_image_id()
	{
		return chromosome_g_image_id;
	}
	public void setChromosome_g_image_id(String chromosome_g_image_id)
	{
		this.chromosome_g_image_id = chromosome_g_image_id;
	}
	public String getBiochemical_gene_markers()
	{
		return biochemical_gene_markers;
	}
	public void setBiochemical_gene_markers(String biochemical_gene_markers)
	{
		this.biochemical_gene_markers = biochemical_gene_markers;
	}
	public String getHistocompatibility_gene() 
	{
		return histocompatibility_gene;
	}
	public void setHistocompatibility_gene(String histocompatibility_gene)
	{
		this.histocompatibility_gene = histocompatibility_gene;
	}
	public String getFrame_type()
	{
		return frame_type;
	}
	public void setFrame_type(String frame_type)
	{
		this.frame_type = frame_type;
	}
	public String getCoat_color_gene()
	{
		return coat_color_gene;
	}
	public void setCoat_color_gene(String coat_color_gene)
	{
		this.coat_color_gene = coat_color_gene;
	}
	public String getBlood_group_gene() 
	{
		return blood_group_gene;
	}
	public void setBlood_group_gene(String blood_group_gene)
	{
		this.blood_group_gene = blood_group_gene;
	}
	public String getMandibular_characteristics()
	{
		return mandibular_characteristics;
	}
	public void setMandibular_characteristics(String mandibular_characteristics)
	{
		this.mandibular_characteristics = mandibular_characteristics;
	}
	public String getMicrosatellite() 
	{
		return microsatellite;
	}
	public void setMicrosatellite(String microsatellite) 
	{
		this.microsatellite = microsatellite;
	}
	public String getAnimal_classification() 
	{
		return animal_classification;
	}
	public void setAnimal_classification(String animal_classification) 
	{
		this.animal_classification = animal_classification;
	}
	public String getTra_name()
	{
		return tra_name;
	}
	public void setTra_name(String tra_name) 
	{
		this.tra_name = tra_name;
	}
	public String getTra_background() 
	{
		return tra_background;
	}
	public void setTra_background(String tra_background)
	{
		this.tra_background = tra_background;
	}
	public String getTra_insert_transgene_name()
	{
		return tra_insert_transgene_name;
	}
	public void setTra_insert_transgene_name(String tra_insert_transgene_name) 
	{
		this.tra_insert_transgene_name = tra_insert_transgene_name;
	}
	public String getTra_insertion_site()
	{
		return tra_insertion_site;
	}
	public void setTra_insertion_site(String tra_insertion_site) 
	{
		this.tra_insertion_site = tra_insertion_site;
	}
	public String getTra_copy_number() 
	{
		return tra_copy_number;
	}
	public void setTra_copy_number(String tra_copy_number)
	{
		this.tra_copy_number = tra_copy_number;
	}
	public String getTra_abnormal_phenotype()
	{
		return tra_abnormal_phenotype;
	}
	public void setTra_abnormal_phenotype(String tra_abnormal_phenotype)
	{
		this.tra_abnormal_phenotype = tra_abnormal_phenotype;
	}
	public String getTra_references()
	{
		return tra_references;
	}
	public void setTra_references(String tra_references) 
	{
		this.tra_references = tra_references;
	}
	public String getTar_name() 
	{
		return tar_name;
	}
	public void setTar_name(String tar_name)
	{
		this.tar_name = tar_name;
	}
	public String getTar_background()
	{
		return tar_background;
	}
	public void setTar_background(String tar_background)
	{
		this.tar_background = tar_background;
	}
	public String getTar_insert_transgene_name() 
	{
		return tar_insert_transgene_name;
	}
	public void setTar_insert_transgene_name(String tar_insert_transgene_name) 
	{
		this.tar_insert_transgene_name = tar_insert_transgene_name;
	}
	public String getTar_eliminating_gene_name()
	{
		return tar_eliminating_gene_name;
	}
	public void setTar_eliminating_gene_name(String tar_eliminating_gene_name)
	{
		this.tar_eliminating_gene_name = tar_eliminating_gene_name;
	}
	public String getTar_abnormal_phenotype()
	{
		return tar_abnormal_phenotype;
	}
	public void setTar_abnormal_phenotype(String tar_abnormal_phenotype)
	{
		this.tar_abnormal_phenotype = tar_abnormal_phenotype;
	}
	public String getTar_references()
	{
		return tar_references;
	}
	public void setTar_references(String tar_references) 
	{
		this.tar_references = tar_references;
	}
	public String getOth_name() 
	{
		return oth_name;
	}
	public void setOth_name(String oth_name)
	{
		this.oth_name = oth_name;
	}
	public String getOth_background()
	{
		return oth_background;
	}
	public void setOth_background(String oth_background) 
	{
		this.oth_background = oth_background;
	}
	public String getOth_mutant_gene() 
	{
		return oth_mutant_gene;
	}
	public void setOth_mutant_gene(String oth_mutant_gene)
	{
		this.oth_mutant_gene = oth_mutant_gene;
	}
	public String getOth_mutant_site()
	{
		return oth_mutant_site;
	}
	public void setOth_mutant_site(String oth_mutant_site)
	{
		this.oth_mutant_site = oth_mutant_site;
	}
	public String getOth_abnormal_phenotype()
	{
		return oth_abnormal_phenotype;
	}
	public void setOth_abnormal_phenotype(String oth_abnormal_phenotype)
	{
		this.oth_abnormal_phenotype = oth_abnormal_phenotype;
	}
	public String getOth_references()
	{
		return oth_references;
	}
	public void setOth_references(String oth_references)
	{
		this.oth_references = oth_references;
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
