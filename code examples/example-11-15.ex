defmodule DarMetaData.DataAccess do
  import Ecto.Query

  def write_meta meta do
      metax = %MetaData{
        name: meta.name,
        origin: meta.origin,
        timestamp: meta.timestamp,
        gfsid: meta.gfsid,
        haspdf: meta.haspdf
      }
      cs = MetaData.changeset metax
      case DARMetaData.Repo.insert!(cs) do
          meta ->
              {:ok, meta}
      end
  end

  def get_meta id do
    query = from m in MetaData,
            where: m.id == ^id,
            select: m
    DARMetaData.Repo.all(query)
  end

  def get_meta_all do
    query = from m in MetaData,
            select: m
    DARMetaData.Repo.all(query)
  end

  def get_imagemeta id do
    query = from mi in MetaDataImage,
            where: mi.metaid == ^id,
            select: mi
    DARMetaData.Repo.all(query)
  end
end
